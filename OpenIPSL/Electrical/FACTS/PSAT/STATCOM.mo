within OpenIPSL.Electrical.FACTS.PSAT;
model STATCOM "Static Synchronous Compensator model with equation"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    enableangle_0=true,
    enablev_0=true,
    enablefn=true,
    enableV_b=true,
    enableS_b=true);
  OpenIPSL.Interfaces.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));

  parameter SI.ApparentPower Sn(displayUnit="MVA")=S_b "Power rating"
    annotation (Dialog(group="Device parameters"));
  parameter SI.Voltage Vn(displayUnit="kV")=V_b "Voltage rating"
    annotation (Dialog(group="Device parameters"));

   parameter SI.PerUnit Qg=0 "Reactive power injection (system base)"
    annotation (Dialog(group="Device parameters"));
  parameter Real Kr=50 "Regulator gain [pu/pu]"
    annotation (Dialog(group="Device parameters"));
  parameter SI.Time Tr=0.01 "Regulator time constant"
    annotation (Dialog(group="Device parameters"));
  parameter SI.PerUnit i_Max=0.7 "Maximum current (local base)"
    annotation (Dialog(group="Device parameters"));
  parameter SI.PerUnit i_Min=-0.1 "Minimum current (local base)"
    annotation (Dialog(group="Device parameters"));
  parameter SI.PerUnit v_POD=0 "Power oscillation damper signal"
    annotation (Dialog(group="Device parameters"));
  SI.PerUnit i_SH "STATCOM current";
  SI.PerUnit v(start=v_0) "Bus voltage magnitude";
  SI.PerUnit Q(start=Qg) "Injected reactive power (system base)";
protected
  parameter SI.PerUnit In=Sn/Vn "Nominal current (local base)";
  parameter SI.PerUnit I_b=S_b/V_b "Base current";
  parameter Real i_max=i_Max*In/I_b "Max current (system base)";
  parameter Real i_min=i_Min*In/I_b "Min current (system base)";
  parameter Real vr0=v_0*cos(angle_0rad) "Initial real voltage";
  parameter Real vi0=v_0*sin(angle_0rad) "Initial imaginary voltage";
  parameter Real uo=v_ref + v_POD - v_0 "Initialization";
  parameter Real i0=Qg/v_0 "Initial current";
  parameter Real v_ref=i0/Kr + v_0 - v_POD "Initialization";
  //parameter Real vmin=v_ref + v_POD - i_max/Kr;
  //parameter Real vmax=v_ref + v_POD - i_min/Kr;
  //parameter Real umax=i_max/Kr;
  //parameter Real umin=i_min/Kr;
  Real u(start=uo);
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=Kr,
    T=Tr,
    y_start=i0,
    outMax=i_max,
    outMin=i_min)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
equation
  v = sqrt(p.vr^2 + p.vi^2);
  0 = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  u = v_ref + v_POD - v;
  Q = i_SH*v;
  simpleLagLim.u = u;
  simpleLagLim.y = i_SH;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Ellipse(
          extent={{-2,22},{48,-22}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),Ellipse(
          extent={{34,24},{84,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),Line(
          points={{-38,0},{-2,0},{-2,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{84,2},{100,2},{100,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-90,6},{-82,6},{-76,6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-90,-6},{-82,-6},{-76,-6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-38,0},{-46,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-84,6},{-84,26},{-46,26},{-46,-24},{-82,-24},{-84,-24},{-84,
            -6},{-84,-6}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-34,-38},{24,-68}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="%Name")}),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end STATCOM;
