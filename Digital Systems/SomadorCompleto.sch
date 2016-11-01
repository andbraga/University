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
        <signal name="XLXN_3" />
        <signal name="S" />
        <signal name="A" />
        <signal name="B" />
        <signal name="Cin" />
        <signal name="Cout" />
        <port polarity="Output" name="S" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="Cin" />
        <port polarity="Output" name="Cout" />
        <blockdef name="xor3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="208" y1="-128" y2="-128" x1="256" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <arc ex="64" ey="-176" sx="64" sy="-80" r="56" cx="32" cy="-128" />
            <arc ex="128" ey="-176" sx="208" sy="-128" r="88" cx="132" cy="-88" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="64" y1="-80" y2="-80" x1="128" />
            <line x2="64" y1="-176" y2="-176" x1="128" />
            <arc ex="208" ey="-128" sx="128" sy="-80" r="88" cx="132" cy="-168" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="xor3" name="XLXI_1">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="A" name="I2" />
            <blockpin signalname="S" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="Cin" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_5">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_1" name="I2" />
            <blockpin signalname="Cout" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1024" y="1056" name="XLXI_1" orien="R0" />
        <instance x="1024" y="1232" name="XLXI_2" orien="R0" />
        <instance x="1024" y="1392" name="XLXI_3" orien="R0" />
        <instance x="1024" y="1552" name="XLXI_4" orien="R0" />
        <instance x="1360" y="1424" name="XLXI_5" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1360" y1="1136" y2="1136" x1="1280" />
            <wire x2="1360" y1="1136" y2="1232" x1="1360" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1360" y1="1296" y2="1296" x1="1280" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1360" y1="1456" y2="1456" x1="1280" />
            <wire x2="1360" y1="1360" y2="1456" x1="1360" />
        </branch>
        <branch name="S">
            <wire x2="1600" y1="928" y2="928" x1="1280" />
        </branch>
        <branch name="A">
            <wire x2="992" y1="864" y2="864" x1="800" />
            <wire x2="1024" y1="864" y2="864" x1="992" />
            <wire x2="992" y1="864" y2="1104" x1="992" />
            <wire x2="1024" y1="1104" y2="1104" x1="992" />
            <wire x2="992" y1="1104" y2="1264" x1="992" />
            <wire x2="1024" y1="1264" y2="1264" x1="992" />
        </branch>
        <branch name="B">
            <wire x2="928" y1="928" y2="928" x1="800" />
            <wire x2="1024" y1="928" y2="928" x1="928" />
            <wire x2="928" y1="928" y2="1168" x1="928" />
            <wire x2="928" y1="1168" y2="1424" x1="928" />
            <wire x2="1024" y1="1424" y2="1424" x1="928" />
            <wire x2="1024" y1="1168" y2="1168" x1="928" />
        </branch>
        <branch name="Cin">
            <wire x2="864" y1="992" y2="992" x1="800" />
            <wire x2="1024" y1="992" y2="992" x1="864" />
            <wire x2="864" y1="992" y2="1328" x1="864" />
            <wire x2="864" y1="1328" y2="1488" x1="864" />
            <wire x2="1024" y1="1488" y2="1488" x1="864" />
            <wire x2="1024" y1="1328" y2="1328" x1="864" />
        </branch>
        <iomarker fontsize="28" x="800" y="864" name="A" orien="R180" />
        <iomarker fontsize="28" x="800" y="928" name="B" orien="R180" />
        <iomarker fontsize="28" x="800" y="992" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="1600" y="928" name="S" orien="R0" />
        <branch name="Cout">
            <wire x2="1648" y1="1296" y2="1296" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1648" y="1296" name="Cout" orien="R0" />
    </sheet>
</drawing>