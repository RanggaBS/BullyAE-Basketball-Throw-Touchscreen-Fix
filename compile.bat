@ECHO OFF

@REM STimeCycle

luac -s STimeCycle.lua

IF EXIST STimeCycle.lur (
	DEL STimeCycle.lur
)

RENAME luac.out STimeCycle.lur

@REM SLvesEff

luac -s SLvesEff.lua

IF EXIST SLvesEff.lur (
	DEL SLvesEff.lur
)

RENAME luac.out SLvesEff.lur
