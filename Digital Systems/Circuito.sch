<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="HAB" />
        <signal name="COD" />
        <signal name="S0(3:0)" />
        <signal name="S1(3:0)" />
        <signal name="A(3:0)" />
        <signal name="X(3:0)" />
        <signal name="Y(3:0)" />
        <signal name="B(3:0)" />
        <signal name="C(3:0)" />
        <signal name="Cin0" />
        <signal name="Cin1" />
        <signal name="Cout0" />
        <signal name="Cout1" />
        <port polarity="Input" name="HAB" />
        <port polarity="Input" name="COD" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="X(3:0)" />
        <port polarity="Input" name="Y(3:0)" />
        <port polarity="Output" name="B(3:0)" />
        <port polarity="Output" name="C(3:0)" />
        <port polarity="Output" name="Cout0" />
        <port polarity="Output" name="Cout1" />
        <blockdef name="SomadorQuatroBits">
            <timestamp>2014-4-17T16:53:59</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Selector">
            <timestamp>2014-4-15T16:36:56</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="SomadorQuatroBits" name="SQB0">
            <blockpin signalname="Cin0" name="C0" />
            <blockpin signalname="X(3:0)" name="A(3:0)" />
            <blockpin signalname="A(3:0)" name="B(3:0)" />
            <blockpin signalname="Cout0" name="C4" />
            <blockpin signalname="S0(3:0)" name="S(3:0)" />
        </block>
        <block symbolname="Selector" name="Selector0">
            <blockpin signalname="HAB" name="HAB" />
            <blockpin signalname="COD" name="COD" />
            <blockpin signalname="A(3:0)" name="I0(3:0)" />
            <blockpin signalname="S0(3:0)" name="I1(3:0)" />
            <blockpin signalname="B(3:0)" name="O(3:0)" />
        </block>
        <block symbolname="Selector" name="Selector1">
            <blockpin signalname="HAB" name="HAB" />
            <blockpin signalname="COD" name="COD" />
            <blockpin signalname="A(3:0)" name="I0(3:0)" />
            <blockpin signalname="S1(3:0)" name="I1(3:0)" />
            <blockpin signalname="C(3:0)" name="O(3:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_11">
            <blockpin signalname="Cin0" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_12">
            <blockpin signalname="Cin1" name="G" />
        </block>
        <block symbolname="SomadorQuatroBits" name="SQB1">
            <blockpin signalname="Cin1" name="C0" />
            <blockpin signalname="Y(3:0)" name="A(3:0)" />
            <blockpin signalname="A(3:0)" name="B(3:0)" />
            <blockpin signalname="Cout1" name="C4" />
            <blockpin signalname="S1(3:0)" name="S(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="HAB">
            <wire x2="1232" y1="1248" y2="1248" x1="1056" />
            <wire x2="1232" y1="1248" y2="1328" x1="1232" />
            <wire x2="1408" y1="1248" y2="1248" x1="1232" />
            <wire x2="1408" y1="1248" y2="1264" x1="1408" />
            <wire x2="1056" y1="1248" y2="1264" x1="1056" />
        </branch>
        <branch name="COD">
            <wire x2="1232" y1="1216" y2="1216" x1="992" />
            <wire x2="1472" y1="1216" y2="1216" x1="1232" />
            <wire x2="1472" y1="1216" y2="1264" x1="1472" />
            <wire x2="992" y1="1216" y2="1264" x1="992" />
            <wire x2="1232" y1="1136" y2="1216" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="1136" name="COD" orien="R270" />
        <iomarker fontsize="28" x="1232" y="1328" name="HAB" orien="R90" />
        <instance x="896" y="688" name="SQB0" orien="M90">
        </instance>
        <branch name="S0(3:0)">
            <wire x2="864" y1="1072" y2="1088" x1="864" />
            <wire x2="864" y1="1088" y2="1248" x1="864" />
            <wire x2="864" y1="1248" y2="1264" x1="864" />
        </branch>
        <branch name="S1(3:0)">
            <wire x2="1600" y1="1072" y2="1088" x1="1600" />
            <wire x2="1600" y1="1088" y2="1248" x1="1600" />
            <wire x2="1600" y1="1248" y2="1264" x1="1600" />
        </branch>
        <branch name="X(3:0)">
            <wire x2="800" y1="576" y2="592" x1="800" />
            <wire x2="800" y1="592" y2="688" x1="800" />
        </branch>
        <branch name="Y(3:0)">
            <wire x2="1664" y1="576" y2="592" x1="1664" />
            <wire x2="1664" y1="592" y2="688" x1="1664" />
        </branch>
        <iomarker fontsize="28" x="800" y="576" name="X(3:0)" orien="R270" />
        <iomarker fontsize="28" x="1664" y="576" name="Y(3:0)" orien="R270" />
        <branch name="A(3:0)">
            <wire x2="864" y1="624" y2="688" x1="864" />
            <wire x2="928" y1="624" y2="624" x1="864" />
            <wire x2="928" y1="624" y2="1264" x1="928" />
            <wire x2="928" y1="560" y2="624" x1="928" />
            <wire x2="1232" y1="560" y2="560" x1="928" />
            <wire x2="1536" y1="560" y2="560" x1="1232" />
            <wire x2="1536" y1="560" y2="624" x1="1536" />
            <wire x2="1536" y1="624" y2="1264" x1="1536" />
            <wire x2="1600" y1="624" y2="624" x1="1536" />
            <wire x2="1600" y1="624" y2="688" x1="1600" />
            <wire x2="1232" y1="528" y2="560" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="528" name="A(3:0)" orien="R270" />
        <branch name="B(3:0)">
            <wire x2="1056" y1="1648" y2="1680" x1="1056" />
            <wire x2="1056" y1="1680" y2="1696" x1="1056" />
        </branch>
        <branch name="C(3:0)">
            <wire x2="1408" y1="1648" y2="1680" x1="1408" />
            <wire x2="1408" y1="1680" y2="1696" x1="1408" />
        </branch>
        <iomarker fontsize="28" x="1056" y="1696" name="B(3:0)" orien="R90" />
        <iomarker fontsize="28" x="1408" y="1696" name="C(3:0)" orien="R90" />
        <branch name="Cin0">
            <wire x2="720" y1="592" y2="592" x1="704" />
            <wire x2="736" y1="592" y2="592" x1="720" />
            <wire x2="736" y1="592" y2="672" x1="736" />
            <wire x2="736" y1="672" y2="688" x1="736" />
        </branch>
        <branch name="Cin1">
            <wire x2="1728" y1="592" y2="688" x1="1728" />
            <wire x2="1744" y1="592" y2="592" x1="1728" />
            <wire x2="1760" y1="592" y2="592" x1="1744" />
        </branch>
        <branch name="Cout0">
            <wire x2="736" y1="1072" y2="1088" x1="736" />
            <wire x2="736" y1="1088" y2="1104" x1="736" />
        </branch>
        <iomarker fontsize="28" x="736" y="1104" name="Cout0" orien="R90" />
        <branch name="Cout1">
            <wire x2="1728" y1="1072" y2="1088" x1="1728" />
            <wire x2="1728" y1="1088" y2="1104" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1728" y="1104" name="Cout1" orien="R90" />
        <instance x="832" y="1264" name="Selector0" orien="R90">
        </instance>
        <instance x="1632" y="1264" name="Selector1" orien="M90">
        </instance>
        <instance x="576" y="528" name="XLXI_11" orien="R90" />
        <instance x="1888" y="528" name="XLXI_12" orien="M90" />
        <instance x="1568" y="688" name="SQB1" orien="R90">
        </instance>
    </sheet>
</drawing>