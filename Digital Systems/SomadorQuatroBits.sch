<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="C1" />
        <signal name="C3" />
        <signal name="C2" />
        <signal name="C4" />
        <signal name="C0" />
        <signal name="B(0)" />
        <signal name="A(0)" />
        <signal name="B(1)" />
        <signal name="A(1)" />
        <signal name="B(2)" />
        <signal name="A(2)" />
        <signal name="B(3)" />
        <signal name="A(3)" />
        <signal name="S(0)" />
        <signal name="S(1)" />
        <signal name="S(2)" />
        <signal name="S(3)" />
        <signal name="S(3:0)" />
        <signal name="A(3:0)" />
        <signal name="B(3:0)" />
        <port polarity="Output" name="C4" />
        <port polarity="Input" name="C0" />
        <port polarity="Output" name="S(3:0)" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <blockdef name="SomadorCompleto">
            <timestamp>2014-4-14T20:37:50</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="SomadorCompleto" name="SC0">
            <blockpin signalname="A(0)" name="A" />
            <blockpin signalname="B(0)" name="B" />
            <blockpin signalname="C0" name="Cin" />
            <blockpin signalname="S(0)" name="S" />
            <blockpin signalname="C1" name="Cout" />
        </block>
        <block symbolname="SomadorCompleto" name="SC1">
            <blockpin signalname="A(1)" name="A" />
            <blockpin signalname="B(1)" name="B" />
            <blockpin signalname="C1" name="Cin" />
            <blockpin signalname="S(1)" name="S" />
            <blockpin signalname="C2" name="Cout" />
        </block>
        <block symbolname="SomadorCompleto" name="SC2">
            <blockpin signalname="A(2)" name="A" />
            <blockpin signalname="B(2)" name="B" />
            <blockpin signalname="C2" name="Cin" />
            <blockpin signalname="S(2)" name="S" />
            <blockpin signalname="C3" name="Cout" />
        </block>
        <block symbolname="SomadorCompleto" name="SC3">
            <blockpin signalname="A(3)" name="A" />
            <blockpin signalname="B(3)" name="B" />
            <blockpin signalname="C3" name="Cin" />
            <blockpin signalname="S(3)" name="S" />
            <blockpin signalname="C4" name="Cout" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="640" y="624" name="SC0" orien="R90">
        </instance>
        <instance x="960" y="624" name="SC1" orien="R90">
        </instance>
        <instance x="1280" y="624" name="SC2" orien="R90">
        </instance>
        <instance x="1600" y="624" name="SC3" orien="R90">
        </instance>
        <branch name="C1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="608" type="branch" />
            <wire x2="672" y1="1008" y2="1024" x1="672" />
            <wire x2="928" y1="1024" y2="1024" x1="672" />
            <wire x2="960" y1="608" y2="608" x1="928" />
            <wire x2="992" y1="608" y2="608" x1="960" />
            <wire x2="992" y1="608" y2="624" x1="992" />
            <wire x2="928" y1="608" y2="1024" x1="928" />
        </branch>
        <branch name="C3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1600" y="608" type="branch" />
            <wire x2="1312" y1="1008" y2="1024" x1="1312" />
            <wire x2="1568" y1="1024" y2="1024" x1="1312" />
            <wire x2="1600" y1="608" y2="608" x1="1568" />
            <wire x2="1632" y1="608" y2="608" x1="1600" />
            <wire x2="1632" y1="608" y2="624" x1="1632" />
            <wire x2="1568" y1="608" y2="1024" x1="1568" />
        </branch>
        <branch name="C2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="608" type="branch" />
            <wire x2="992" y1="1008" y2="1024" x1="992" />
            <wire x2="1248" y1="1024" y2="1024" x1="992" />
            <wire x2="1280" y1="608" y2="608" x1="1248" />
            <wire x2="1312" y1="608" y2="608" x1="1280" />
            <wire x2="1312" y1="608" y2="624" x1="1312" />
            <wire x2="1248" y1="608" y2="1024" x1="1248" />
        </branch>
        <branch name="C4">
            <wire x2="1632" y1="1008" y2="1056" x1="1632" />
            <wire x2="1632" y1="1056" y2="1072" x1="1632" />
        </branch>
        <branch name="C0">
            <wire x2="672" y1="592" y2="608" x1="672" />
            <wire x2="672" y1="608" y2="624" x1="672" />
        </branch>
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="736" y="576" type="branch" />
            <wire x2="736" y1="528" y2="576" x1="736" />
            <wire x2="736" y1="576" y2="624" x1="736" />
        </branch>
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1056" y="592" type="branch" />
            <wire x2="1056" y1="528" y2="592" x1="1056" />
            <wire x2="1056" y1="592" y2="624" x1="1056" />
        </branch>
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="512" type="branch" />
            <wire x2="1120" y1="448" y2="512" x1="1120" />
            <wire x2="1120" y1="512" y2="624" x1="1120" />
        </branch>
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="592" type="branch" />
            <wire x2="1376" y1="528" y2="592" x1="1376" />
            <wire x2="1376" y1="592" y2="624" x1="1376" />
        </branch>
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="512" type="branch" />
            <wire x2="1440" y1="448" y2="512" x1="1440" />
            <wire x2="1440" y1="512" y2="624" x1="1440" />
        </branch>
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1696" y="592" type="branch" />
            <wire x2="1696" y1="528" y2="592" x1="1696" />
            <wire x2="1696" y1="592" y2="624" x1="1696" />
        </branch>
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="512" type="branch" />
            <wire x2="1760" y1="448" y2="512" x1="1760" />
            <wire x2="1760" y1="512" y2="624" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="672" y="592" name="C0" orien="R270" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="1120" type="branch" />
            <wire x2="800" y1="1008" y2="1120" x1="800" />
            <wire x2="800" y1="1120" y2="1184" x1="800" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="1120" type="branch" />
            <wire x2="1120" y1="1008" y2="1120" x1="1120" />
            <wire x2="1120" y1="1120" y2="1184" x1="1120" />
        </branch>
        <branch name="S(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1120" type="branch" />
            <wire x2="1440" y1="1008" y2="1120" x1="1440" />
            <wire x2="1440" y1="1120" y2="1184" x1="1440" />
        </branch>
        <branch name="S(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1120" type="branch" />
            <wire x2="1760" y1="1008" y2="1120" x1="1760" />
            <wire x2="1760" y1="1120" y2="1184" x1="1760" />
        </branch>
        <branch name="S(3:0)">
            <wire x2="1280" y1="1280" y2="1440" x1="1280" />
        </branch>
        <branch name="S(3:0)">
            <wire x2="1120" y1="1280" y2="1280" x1="800" />
            <wire x2="1440" y1="1280" y2="1280" x1="1120" />
            <wire x2="1760" y1="1280" y2="1280" x1="1440" />
        </branch>
        <bustap x2="800" y1="1280" y2="1184" x1="800" />
        <bustap x2="1120" y1="1280" y2="1184" x1="1120" />
        <bustap x2="1440" y1="1280" y2="1184" x1="1440" />
        <bustap x2="1760" y1="1280" y2="1184" x1="1760" />
        <iomarker fontsize="28" x="1280" y="1440" name="S(3:0)" orien="R90" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="512" type="branch" />
            <wire x2="800" y1="448" y2="512" x1="800" />
            <wire x2="800" y1="512" y2="624" x1="800" />
        </branch>
        <branch name="A(3:0)">
            <wire x2="1120" y1="352" y2="352" x1="800" />
            <wire x2="1360" y1="352" y2="352" x1="1120" />
            <wire x2="1440" y1="352" y2="352" x1="1360" />
            <wire x2="1760" y1="352" y2="352" x1="1440" />
            <wire x2="1360" y1="272" y2="352" x1="1360" />
        </branch>
        <bustap x2="800" y1="352" y2="448" x1="800" />
        <bustap x2="1120" y1="352" y2="448" x1="1120" />
        <bustap x2="1440" y1="352" y2="448" x1="1440" />
        <bustap x2="1760" y1="352" y2="448" x1="1760" />
        <iomarker fontsize="28" x="1360" y="272" name="A(3:0)" orien="R270" />
        <branch name="B(3:0)">
            <wire x2="1056" y1="432" y2="432" x1="736" />
            <wire x2="1248" y1="432" y2="432" x1="1056" />
            <wire x2="1376" y1="432" y2="432" x1="1248" />
            <wire x2="1696" y1="432" y2="432" x1="1376" />
            <wire x2="1248" y1="272" y2="432" x1="1248" />
        </branch>
        <bustap x2="736" y1="432" y2="528" x1="736" />
        <bustap x2="1056" y1="432" y2="528" x1="1056" />
        <bustap x2="1376" y1="432" y2="528" x1="1376" />
        <bustap x2="1696" y1="432" y2="528" x1="1696" />
        <iomarker fontsize="28" x="1248" y="272" name="B(3:0)" orien="R270" />
        <iomarker fontsize="28" x="1632" y="1072" name="C4" orien="R90" />
    </sheet>
</drawing>