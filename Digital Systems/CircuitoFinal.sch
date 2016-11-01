<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(3:0)" />
        <signal name="XLXN_3(3:0)" />
        <signal name="COD" />
        <signal name="X(3:0)" />
        <signal name="Cout1" />
        <signal name="Cout0" />
        <signal name="HAB" />
        <signal name="Clock" />
        <signal name="O" />
        <signal name="XLXN_48" />
        <signal name="Y(1)" />
        <signal name="Y(2)" />
        <signal name="Y(3)" />
        <signal name="Y(3:0)" />
        <signal name="Y(0)" />
        <signal name="X(2)" />
        <signal name="X(1)" />
        <signal name="X(0)" />
        <signal name="X(3)" />
        <signal name="A(3:0)" />
        <signal name="XLXN_50(3:0)" />
        <port polarity="Input" name="COD" />
        <port polarity="Output" name="Cout1" />
        <port polarity="Output" name="Cout0" />
        <port polarity="Input" name="HAB" />
        <port polarity="Input" name="Clock" />
        <port polarity="Output" name="O" />
        <port polarity="Input" name="A(3:0)" />
        <blockdef name="Circuito">
            <timestamp>2014-5-8T14:58:26</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-220" height="24" />
            <line x2="384" y1="-208" y2="-208" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <line x2="384" y1="-48" y2="-48" x1="320" />
        </blockdef>
        <blockdef name="verParidadeFinal">
            <timestamp>2014-5-15T17:25:30</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="352" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Sequenciador">
            <timestamp>2014-5-24T20:40:2</timestamp>
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="256" x="64" y="-384" height="512" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="checkBCD">
            <timestamp>2014-5-26T15:42:24</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="Circuito" name="Projecto1">
            <blockpin signalname="HAB" name="HAB" />
            <blockpin signalname="COD" name="COD" />
            <blockpin signalname="XLXN_50(3:0)" name="A(3:0)" />
            <blockpin signalname="X(3:0)" name="X(3:0)" />
            <blockpin signalname="Y(3:0)" name="Y(3:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_3(3:0)" name="C(3:0)" />
            <blockpin signalname="Cout0" name="Cout0" />
            <blockpin signalname="Cout1" name="Cout1" />
        </block>
        <block symbolname="verParidadeFinal" name="verParidadeFInal0">
            <blockpin signalname="XLXN_2(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_3(3:0)" name="C(3:0)" />
            <blockpin signalname="XLXN_48" name="BitPar" />
        </block>
        <block symbolname="vcc" name="XLXI_13">
            <blockpin signalname="Y(0)" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_14">
            <blockpin signalname="Y(1)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="Y(2)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_16">
            <blockpin signalname="Y(3)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_17">
            <blockpin signalname="X(3)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_18">
            <blockpin signalname="X(1)" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_19">
            <blockpin signalname="X(2)" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_20">
            <blockpin signalname="X(0)" name="P" />
        </block>
        <block symbolname="Sequenciador" name="Sequenciador0">
            <blockpin signalname="XLXN_48" name="BP" />
            <blockpin signalname="HAB" name="HAB" />
            <blockpin signalname="COD" name="COD" />
            <blockpin signalname="Clock" name="clk" />
            <blockpin signalname="XLXN_2(3:0)" name="B(3:0)" />
            <blockpin signalname="XLXN_3(3:0)" name="C(3:0)" />
            <blockpin signalname="O" name="O" />
        </block>
        <block symbolname="checkBCD" name="checkBCD0">
            <blockpin signalname="A(3:0)" name="A(3:0)" />
            <blockpin signalname="XLXN_50(3:0)" name="S(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1312" y="640" name="Projecto1" orien="R90">
        </instance>
        <branch name="COD">
            <wire x2="1952" y1="576" y2="576" x1="1536" />
            <wire x2="2352" y1="576" y2="576" x1="1952" />
            <wire x2="2352" y1="576" y2="1024" x1="2352" />
            <wire x2="2496" y1="1024" y2="1024" x1="2352" />
            <wire x2="1536" y1="576" y2="640" x1="1536" />
            <wire x2="1952" y1="448" y2="576" x1="1952" />
            <wire x2="2000" y1="448" y2="448" x1="1952" />
            <wire x2="2000" y1="448" y2="464" x1="2000" />
        </branch>
        <branch name="X(3:0)">
            <wire x2="1168" y1="400" y2="400" x1="1104" />
            <wire x2="1200" y1="400" y2="400" x1="1168" />
            <wire x2="1200" y1="400" y2="528" x1="1200" />
            <wire x2="1408" y1="528" y2="528" x1="1200" />
            <wire x2="1408" y1="528" y2="640" x1="1408" />
            <wire x2="1232" y1="400" y2="400" x1="1200" />
            <wire x2="1296" y1="400" y2="400" x1="1232" />
        </branch>
        <branch name="Cout1">
            <wire x2="1360" y1="1024" y2="1056" x1="1360" />
        </branch>
        <branch name="Cout0">
            <wire x2="1440" y1="1024" y2="1056" x1="1440" />
        </branch>
        <branch name="HAB">
            <wire x2="1952" y1="640" y2="640" x1="1600" />
            <wire x2="2288" y1="640" y2="640" x1="1952" />
            <wire x2="2288" y1="640" y2="1088" x1="2288" />
            <wire x2="2496" y1="1088" y2="1088" x1="2288" />
            <wire x2="1952" y1="640" y2="768" x1="1952" />
            <wire x2="1904" y1="752" y2="768" x1="1904" />
            <wire x2="1952" y1="768" y2="768" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1056" name="Cout1" orien="R90" />
        <iomarker fontsize="28" x="1440" y="1056" name="Cout0" orien="R90" />
        <bustap x2="864" y1="608" y2="608" x1="960" />
        <bustap x2="864" y1="544" y2="544" x1="960" />
        <bustap x2="864" y1="736" y2="736" x1="960" />
        <bustap x2="864" y1="672" y2="672" x1="960" />
        <branch name="Y(1)">
            <wire x2="864" y1="608" y2="608" x1="816" />
        </branch>
        <branch name="Y(2)">
            <wire x2="864" y1="672" y2="672" x1="816" />
        </branch>
        <branch name="Y(3)">
            <wire x2="864" y1="736" y2="736" x1="816" />
        </branch>
        <branch name="Y(3:0)">
            <wire x2="960" y1="544" y2="608" x1="960" />
            <wire x2="960" y1="608" y2="640" x1="960" />
            <wire x2="960" y1="640" y2="672" x1="960" />
            <wire x2="960" y1="672" y2="736" x1="960" />
            <wire x2="1024" y1="640" y2="640" x1="960" />
            <wire x2="1344" y1="576" y2="576" x1="1024" />
            <wire x2="1344" y1="576" y2="640" x1="1344" />
            <wire x2="1024" y1="576" y2="640" x1="1024" />
        </branch>
        <branch name="Y(0)">
            <wire x2="864" y1="544" y2="544" x1="816" />
        </branch>
        <instance x="688" y="544" name="XLXI_14" orien="R90" />
        <instance x="688" y="608" name="XLXI_15" orien="R90" />
        <instance x="688" y="672" name="XLXI_16" orien="R90" />
        <instance x="816" y="608" name="XLXI_13" orien="R270" />
        <bustap x2="1168" y1="400" y2="304" x1="1168" />
        <bustap x2="1232" y1="400" y2="304" x1="1232" />
        <bustap x2="1296" y1="400" y2="304" x1="1296" />
        <branch name="X(2)">
            <wire x2="1168" y1="272" y2="304" x1="1168" />
        </branch>
        <branch name="X(1)">
            <wire x2="1232" y1="272" y2="304" x1="1232" />
        </branch>
        <branch name="X(0)">
            <wire x2="1296" y1="272" y2="304" x1="1296" />
        </branch>
        <bustap x2="1104" y1="400" y2="304" x1="1104" />
        <branch name="X(3)">
            <wire x2="1104" y1="272" y2="304" x1="1104" />
        </branch>
        <instance x="1168" y="144" name="XLXI_17" orien="R180" />
        <instance x="1296" y="144" name="XLXI_18" orien="R180" />
        <instance x="1104" y="272" name="XLXI_19" orien="R0" />
        <instance x="1232" y="272" name="XLXI_20" orien="R0" />
        <branch name="A(3:0)">
            <wire x2="1472" y1="192" y2="208" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1472" y="192" name="A(3:0)" orien="R270" />
        <branch name="XLXN_50(3:0)">
            <wire x2="1472" y1="592" y2="640" x1="1472" />
        </branch>
        <instance x="1440" y="208" name="checkBCD0" orien="R90">
        </instance>
        <branch name="XLXN_2(3:0)">
            <wire x2="1600" y1="1024" y2="1088" x1="1600" />
            <wire x2="1824" y1="1088" y2="1088" x1="1600" />
            <wire x2="1600" y1="1088" y2="1216" x1="1600" />
            <wire x2="2496" y1="1216" y2="1216" x1="1600" />
        </branch>
        <instance x="1824" y="1184" name="verParidadeFInal0" orien="R0">
        </instance>
        <branch name="XLXN_48">
            <wire x2="2192" y1="1088" y2="1088" x1="2176" />
            <wire x2="2192" y1="1088" y2="1152" x1="2192" />
            <wire x2="2496" y1="1152" y2="1152" x1="2192" />
        </branch>
        <branch name="Clock">
            <wire x2="2496" y1="1408" y2="1408" x1="2480" />
        </branch>
        <branch name="XLXN_3(3:0)">
            <wire x2="1520" y1="1024" y2="1152" x1="1520" />
            <wire x2="1824" y1="1152" y2="1152" x1="1520" />
            <wire x2="1520" y1="1152" y2="1280" x1="1520" />
            <wire x2="2496" y1="1280" y2="1280" x1="1520" />
        </branch>
        <instance x="2496" y="1376" name="Sequenciador0" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2480" y="1408" name="Clock" orien="R180" />
        <branch name="O">
            <wire x2="2896" y1="1472" y2="1472" x1="2880" />
            <wire x2="2912" y1="1472" y2="1472" x1="2896" />
        </branch>
        <iomarker fontsize="28" x="2912" y="1472" name="O" orien="R0" />
        <iomarker fontsize="28" x="1904" y="752" name="HAB" orien="R270" />
        <iomarker fontsize="28" x="2000" y="464" name="COD" orien="R90" />
    </sheet>
</drawing>