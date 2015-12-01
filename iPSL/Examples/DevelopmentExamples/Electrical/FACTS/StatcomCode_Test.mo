within iPSL.Examples.DevelopmentExamples.Electrical.FACTS;
model StatcomCode_Test
  iPSL.Electrical.Branches.PwLine pwLine4(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {-13, 13}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine2(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {-15, -17}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn2(D = 1, Sn = 370, V_0 = 1.027606413803688, angle_0 = 0.036282466109908, P_0 = 0.800000000076548, Q_0 = 0.500000000133379, V_b = 400, Vn = 200, ra = 0.001, xd1 = 0.302, M = 10) annotation(Placement(transformation(extent = {{-15, -16}, {15, 16}}, rotation = 180, origin = {123, 0})));
  iPSL.Electrical.Branches.PwLine pwLine1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {53, 17}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine3(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {55, -17}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 order2_Inputs_Outputs(Sn = 370, D = 5, P_0 = 0.004219210312137, Q_0 = -0.001421467052118, V_b = 400, V_0 = 1, angle_0 = 0, Vn = 400, ra = 0.001, xd1 = 0.302, M = 10) annotation(Placement(transformation(extent = {{-78, -8}, {-58, 12}})));
  Modelica.Blocks.Sources.Pulse pulse(period = 10, startTime = 4.2, amplitude = 0.045, width = 58, nperiod = -1, offset = 0.999885177318814) annotation(Placement(transformation(extent = {{-158, 14}, {-138, 34}})));
  Modelica.Blocks.Sources.Pulse pulse1(period = 10, amplitude = -0.045, width = 42, startTime = 0, nperiod = -1) annotation(Placement(transformation(extent = {{-156, -22}, {-136, -2}})));
  Modelica.Blocks.Math.Add3 add3_1(k3 = 0, k1 = 1, k2 = 1) annotation(Placement(transformation(extent = {{-118, -10}, {-98, 10}})));
  iPSL.Electrical.Controls.PSAT.FACTS.STATCOM.STATCOM sTATCOM3_1(V_0 = 1, angle_0 = -0.000213067852480) annotation(Placement(transformation(extent = {{-14, -54}, {6, -34}})));
  iPSL.Electrical.Buses.Bus bus annotation(Placement(transformation(extent = {{4, -8}, {24, 12}})));
  iPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ(P2 = 0, P3 = 0, t1 = 7, t3 = 8, t4 = 30, Q3 = +0.42, Q2 = 0.1, t2 = 7.001, P_0 = 0.8, Q_0 = 0.6) annotation(Placement(transformation(extent = {{38, -52}, {58, -32}})));
  inner iPSL.Electrical.SystemBase SysData annotation(Placement(transformation(extent = {{-100, 60}, {-76, 80}})));
equation
  connect(pwLine1.n, pwLine3.n) annotation(Line(points = {{60, 17}, {78, 17}, {78, -17}, {62, -17}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(bus.p, lOADPQ.p) annotation(Line(points = {{14, 2}, {24, 2}, {24, -31}, {48, -31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(sTATCOM3_1.p, lOADPQ.p) annotation(Line(points = {{7, -44}, {20, -44}, {20, 2}, {24, 2}, {24, -31}, {48, -31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.p, lOADPQ.p) annotation(Line(points = {{48, -17}, {38, -17}, {38, 2}, {24, 2}, {24, -31}, {48, -31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.p, lOADPQ.p) annotation(Line(points = {{46, 17}, {38, 17}, {38, 2}, {24, 2}, {24, -31}, {48, -31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(Syn2.p, pwLine3.n) annotation(Line(points = {{106.5, -0.079424}, {78, -0.079424}, {78, -17}, {62, -17}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine2.n, bus.p) annotation(Line(points = {{-8, -17}, {0, -17}, {0, 2}, {14, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine4.n, bus.p) annotation(Line(points = {{-6, 13}, {0, 13}, {0, 2}, {14, 2}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine4.p, pwLine2.p) annotation(Line(points = {{-20, 13}, {-28, 13}, {-28, -17}, {-22, -17}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(order2_Inputs_Outputs.p, pwLine2.p) annotation(Line(points = {{-57, 2.04964}, {-28, 2.04964}, {-28, -17}, {-22, -17}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(add3_1.y, order2_Inputs_Outputs.vf) annotation(Line(points = {{-97, 0}, {-92, 0}, {-92, 7}, {-78, 7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(order2_Inputs_Outputs.vf0, add3_1.u3) annotation(Line(points = {{-76, 13}, {-48, 13}, {-48, -22}, {-120, -22}, {-120, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(pulse1.y, add3_1.u2) annotation(Line(points = {{-135, -12}, {-126, -12}, {-126, 0}, {-120, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(pulse.y, add3_1.u1) annotation(Line(points = {{-137, 24}, {-130, 24}, {-130, 8}, {-120, 8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(order2_Inputs_Outputs.pm0, order2_Inputs_Outputs.pm) annotation(Line(points = {{-76, -9}, {-54, -9}, {-54, -16}, {-90, -16}, {-90, -3}, {-78, -3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Syn2.pm, Syn2.pm0) annotation(Line(points = {{138, 8}, {148, 8}, {148, 26}, {135, 26}, {135, 17.6}}, color = {0, 0, 127}));
  connect(Syn2.vf0, Syn2.vf) annotation(Line(points = {{135, -17.6}, {135, -26}, {152, -26}, {152, -8}, {138, -8}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-160, -100}, {160, 100}})), Icon(coordinateSystem(extent = {{-160, -100}, {160, 100}})), Documentation(info = "<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>KTH own Model, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
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
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end StatcomCode_Test;

