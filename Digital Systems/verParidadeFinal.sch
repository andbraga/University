<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="B(3:0)" />
        <signal name="C(3:0)" />
        <signal name="BitPar" />
        <port polarity="Input" name="B(3:0)" />
        <port polarity="Input" name="C(3:0)" />
        <port polarity="Output" name="BitPar" />
        <blockdef name="VerParidade">
            <timestamp>2014-5-8T16:29:20</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <block symbolname="VerParidade" name="XLXI_2">
            <blockpin signalname="B(3:0)" name="I(3:0)" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="VerParidade" name="XLXI_3">
            <blockpin signalname="C(3:0)" name="I(3:0)" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_4">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="BitPar" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1216" y="464" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1216" y="624" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1648" y="608" name="XLXI_4" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1616" y1="432" y2="432" x1="1600" />
            <wire x2="1616" y1="432" y2="480" x1="1616" />
            <wire x2="1648" y1="480" y2="480" x1="1616" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1616" y1="592" y2="592" x1="1600" />
            <wire x2="1616" y1="544" y2="592" x1="1616" />
            <wire x2="1648" y1="544" y2="544" x1="1616" />
        </branch>
        <branch name="B(3:0)">
            <wire x2="1216" y1="432" y2="432" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="1184" y="432" name="B(3:0)" orien="R180" />
        <branch name="C(3:0)">
            <wire x2="1216" y1="592" y2="592" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="1184" y="592" name="C(3:0)" orien="R180" />
        <branch name="BitPar">
            <wire x2="1936" y1="512" y2="512" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1936" y="512" name="BitPar" orien="R0" />
    </sheet>
</drawing>