Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25219515D7D
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 15:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kr98F14QKz3bdK
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 23:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=qOST4lsR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=77.238.178.96;
 helo=sonic312-25.consmr.mail.ir2.yahoo.com; envelope-from=niikita@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=qOST4lsR; dkim-atps=neutral
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
 (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kr97s1DFBz3050
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 23:24:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1651325089; bh=nQyGxm+POMv3hgHHQjAW5PVBnLFmQk80SNcoU0pI51w=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=qOST4lsRl6AiwuU4EViDFZAvCJXlAsSerKLO+r4KOYrcNRlTYuqhyFSF4hzvbRnHZEcjCE4w+b8S1I2HxeuAfthfUG7yCC3wPGcW15k3xFner1YzpIuL893iB1A85gMoQfPUUGsMxFbyjEVpJyjL/YAM2dKzNyIb7BWbkEd+4e3UjyQJAhOrtYt2rWp6mqRI+Giq622ky145ol4oeub/urCEJT+i/oam1fOTfQhpcTMRFxNCHUhqIvYjsaDYCRQf9psolwG+5HWnIaEfG2Tplxhp2JKOi7D9lmoVbMWQt0hCBXHT3xpB7LRiOy8ewZ1Fd7IXOfGFGhC11RXYuycdnQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1651325089; bh=L3h/J8qxwuqaT1f/uHmf74B7Xwg7VY6N7Az7/ughzuZ=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=s0v8FPGPaBYuXX9x6pIHqkLmsEx3wEtqVt7Utw5REyXkfGoF2T1uxW8oQvn6NCHa/rdd2brdtc2GFnO++HGC2sUFILuXCV0JzAQPDvVwVDTUWxqW5MOkqqLdsAtTACSAMMja0dNZDBL1c/d/frGwchpj4lZbHB5kbDGoFk55pZ13jvlpEFlO4QW+FWS5JidobB2rphWB5hKW8oKzbhmkiZMgpu8ia9uKoQ3ERF63FuRjRDkOvJYy7GMO3XkA04jaY3GeCRK1HrHS8IkUDJFGhFoUG22q0BhBphqtSkhdPQWh1Nd+zzuISKSSz+sTagetB7jk81EN6nZKMKAbCZ3oVg==
X-YMail-OSG: OM7rd2EVM1mJaAXgcOtmscZ8DueIOYzTJO_crHJhqqrOK30MJXyYoV1AsgrLVR4
 t1oVs7h2ZrQ4qaoGvtpKQTjFCrAs68oPXwYhXP4Hq4u40EVQKUXGHCICcgwMLkw2HjPMVv.RTI33
 nZ8Auj32pJzDaGCkWEDJ0flcL_IoSVt8iF5BC5xeCjZRZmuPc6tkRcg0IQ.6hQP8MSEFPoiQMAI3
 yBNcTS8UX02Uj24C1kE3vszCUDTBHskQbH3hU8fJE7KdfA4ZAF27x_qfNe5tGBkgae.CINo617GJ
 iF3LTrni.ojfTgG0MUA6EnqIEuG.Xvt_fjPAm1T2I0hw_6js_UHqpiHOltn_laS1sD9.eoSownpn
 QAda.szURJNcm..kdGyAAJoEwWRvCcYwftPJ3MSaaIRK2bHFCC1NHfIEx8aekDV8WbEz.87LLzVP
 JUZwtL1y_twmLRkP4dQHutc97q4902B_WY5dSqdqYwF8YyPPRGKomnWRp3gNzUnTeoQo01meEADB
 gTBb2Hm220ZpG3F_tHNqLRxeQmQVXkQswt9V8LnRsZG.Yb2uMq5z3MbuK4K8ol5x4xXvYgySzmPz
 1Ajkcon37CE5XF6BelvoJPsXAAWP_0cL2PfNKm_JQxnNu_L8zod4nd3qZlUCF2M4efE4Xf2zgY5.
 kDt0LnAQ3bspbACBnZvav3qtXq6yFQ214SGL2KZeP4nbWiUSgMbnTKDMlpQ238R7yld6a2H6ynHK
 .FFUxwruPa6t3FffAcA5HgrmDVmsOQSPw96CgAMDMDiCwGcdXbAjOjTPvSyk_P8_iFq9rF_cRc2v
 qFW7VTbyxaE78N2T1oxOUCm7jvxPW5tnyNv2tN_HQvyMGI8Eh5Fbo4Wg2QELc0rvxGrbC1HmWnV6
 Y9gNuX1murVye8Jt2DHOFGiFp53.izZSGdjuwZG5RaOmWDK6GgezYitjaxjU2vR7BqpSRHhX0G5E
 glPy.LgcDl4QXza56mRYTzzNt.TircjWatRYoQCG15YQZOcJm_Ftq_eL9irIqmZnSwcOcN7mKnrG
 5kP2nGep6sqALiMlGZexa_tMt.5B5GmGgj8f3ub2bbBhPYywEqOXQWOv0ZVLc2ZcS.kS_kQxXx76
 XeQd9_AYRBPeo0ZGEsyGIaNQouk4JXi5Q9tFbNnPB_qbv4zF6u6bw_HrH1VkoeBU.K1T24Idf23T
 726acIzFsJKdLscita3hOCOSJRg.suJqfERgdDKIsb7WpQrt2kU_wU8RLyckZiS0YLWrwjFewu_5
 hvnSDUaFBCBax2iSDCyQzxgl0UzGR30SuI193w5K9l3uzp.pdGOSPrnjSNYh7Euvtk8e2CDpws5i
 IyynPNFs5t9Nk_qpadMSqQ4xpyroKP1NNRap.O34BC2F1oHQIf_adwfAZdURx03N5ySZ..MiUcJK
 ilNK0VzD0b877QMRBkicD2RtAMjUL4A5FYsHi7eHr_a.ZWMKqIfCafP7MoxmFoOA8T_DrCFQQMOB
 TU_FMUDUHo9y0Rb4Pl.kQ45uX268pPg7xBdPlzRKc_aTKfBFhi6hlVrat9tV87UZwdDGIqz2N9ol
 .kxxFzY2qNNP2vfrU22S1R_rBCdfp8mXdhht65uRjS9jfMM5Et_NQ6LUsgkn7WeX3ujKe3l6SFbu
 VFnNHxvx1MTs8iHJywGTPEOFO0TkDhWKqmtuRzV4TYtirLQ53E_C5Z1ttcGFE9pe4tZmfiTW799W
 p5ULkZ__XiED6aeEinCpHyI6ChmLRr564gfOMVmg8vigBHMerjhFbyINLwFtcDm5YfMTgv9ewto8
 SXFUAalGwFiRkxr4tyiAM96CO2cny6dc4tMibHUuIYD9ghDafHpZz5qWATKXaNDzUbg93PlV3t_9
 jRiPEMp7rm6Cm99TQfzPjx6s9ezq5CYHImuYb28F_HIoCrW1yRUCHm9ElCkbNGJKcV52C3frWOM7
 C2dlb972jRkt1pQxptuGRoN_CYILMAQ6L97RjY2lB5h8N1IutxZqTvh8N57raY3mWWAnNTVdVaPs
 gC865HtKpbDxxm6XxbDXg2w3nJ08FMVhnq9eD3vD99rYTr3a..FNYM4egMc83bn3C1hhDklP3QKh
 Ys5IXNxlwVjzCEQKLykXwabFxokgeG8xv2OwlCdBqbw16PUsNFNk4RM_uXBkZ.GXJDG1ae3ICYvF
 KV4fJGL78WG7OuL8uvdEDNMciDPZjr62QGHboAxwR
X-Sonic-MF: <niikita@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Sat, 30 Apr 2022 13:24:49 +0000
Date: Sat, 30 Apr 2022 13:25:36 +0000 (UTC)
From: Nikita Pavlov <niikita@yahoo.com>
To: "Bills, Jason M" <jason.m.bills@intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <667725503.727721.1651325136829@mail.yahoo.com>
In-Reply-To: <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com>
References: <1790304102.3756861.1651157909253.ref@mail.yahoo.com>
 <1790304102.3756861.1651157909253@mail.yahoo.com>
 <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com>
Subject: Re: x86-power-control question: front panel buttons dont work
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_727720_1149676495.1651325136827"
X-Mailer: WebService/1.1.20118 YMailNorrin
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_727720_1149676495.1651325136827
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason, thank you for your response. In my platform I have power-control =
gpios in GPIOD group like this:
/*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
Also I configurate pass-through mode in dts:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D "pass-through";=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 pinctrl-0 =3D <&pinctrl_gpid0_default=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0&pinctrl_gpid2_default>;
After update and reboot platform I have same problem - front panel buttons =
dont enable (front panel buttons dont enable if I use x86-power-control mod=
ule or manually set gpio values by gpioset utility).But if I dont use any i=
mpacts on gpio (disable x86-power-control module and dont use gpio utilitie=
s like gpioset/get) front panel buttons work well.
What are your assumptions about this ?



=C2=A0--
Best regards,
Nikita Pavlov,
NUST MISiS Student
=20

    =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 28 =D0=B0=D0=BF=D1=80=D0=B5=
=D0=BB=D1=8F 2022 =D0=B3., 23:01:13 GMT+3, Bills, Jason M <jason.m.bills@in=
tel.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=B0): =20
=20
 <!--#yiv3781498404 _filtered {} _filtered {} _filtered {}#yiv3781498404 #y=
iv3781498404 p.yiv3781498404MsoNormal, #yiv3781498404 li.yiv3781498404MsoNo=
rmal, #yiv3781498404 div.yiv3781498404MsoNormal {margin:0in;font-size:11.0p=
t;font-family:"Calibri", sans-serif;}#yiv3781498404 a:link, #yiv3781498404 =
span.yiv3781498404MsoHyperlink {color:blue;text-decoration:underline;}#yiv3=
781498404 span.yiv3781498404EmailStyle18 {font-family:"Calibri", sans-serif=
;color:windowtext;}#yiv3781498404 .yiv3781498404MsoChpDefault {font-size:10=
.0pt;} _filtered {}#yiv3781498404 div.yiv3781498404WordSection1 {}-->
Hi Nikita,
=20
 =C2=A0
=20
In the hardware, we have the power button routed through a GPIO pass-throug=
h on the Aspeed chip.=C2=A0 If that pass-through is disabled, it will preve=
nt the physical front panel button signal from getting past the BMC.=C2=A0 =
That is the first thing I would check.
=20
 =C2=A0
=20
Also, it is better to send these kinds of questions to the OpenBMC mailing =
list as there may be others in the community in a similar situation.
=20
 =C2=A0
=20
Thanks,
=20
-Jason
=20
 =C2=A0
=20
From: Nikita Pavlov <niikita@yahoo.com>=20
Sent: Thursday, April 28, 2022 8:58 AM
To: Bills, Jason M <jason.m.bills@intel.com>; kuiying.wang@intel.com
Subject: x86-power-control question: front panel buttons dont work
=20
 =C2=A0
=20
Hi, I user x86-power-control module for my test intel platform. Its module =
works in webui but front panel physical buttons doesnt work. I think that i=
t interface describe in this fragment=C2=A0https://github.com/openbmc/x86-p=
ower-control/blob/master/src/power_control.cpp#L3072=C2=A0but I cant unders=
tand this logic.
=20
Say me pls, whyfront panel=C2=A0buttons dont work ?
=20
 =C2=A0
=20
 =C2=A0
=20
 =C2=A0
=20
 =C2=A0
=20
 =C2=A0
=20
--
Best regards,
Nikita Pavlov,
NUST MISiS Student
=20
 =C2=A0
  =20
------=_Part_727720_1149676495.1651325136827
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp9b9df09eyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Hi Jason, thank you for your=
 response. In my platform I have power-control gpios in GPIOD group like th=
is:</div><div dir=3D"ltr" data-setdir=3D"false"><span><span style=3D"color:=
 rgb(36, 41, 47); font-family: ui-monospace, SFMono-Regular, SF Mono, Menlo=
, Consolas, Liberation Mono, monospace; font-size: 12px; white-space: pre-w=
rap;"><br></span></span></div><div dir=3D"ltr" data-setdir=3D"false"><span>=
<span style=3D"color: rgb(36, 41, 47); font-family: ui-monospace, SFMono-Re=
gular, SF Mono, Menlo, Consolas, Liberation Mono, monospace; font-size: 12p=
x; white-space: pre-wrap;">/*D0-D7*/=09"POWER_BUTTON","POWER_OUT","RESET_BU=
TTON","RESET_OUT",</span></span></div><div dir=3D"ltr" data-setdir=3D"false=
"><br></div><div dir=3D"ltr" data-setdir=3D"false">Also I configurate pass-=
through mode in dts:</div><div dir=3D"ltr" data-setdir=3D"false"><br></div>=
<div dir=3D"ltr" data-setdir=3D"false"><div><div dir=3D"ltr" data-setdir=3D=
"false"> <div><div>&nbsp; &nbsp; &nbsp; &nbsp; pinctrl-names =3D "pass-thro=
ugh";</div><div>&nbsp; &nbsp; &nbsp; &nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_=
gpid0_default</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&amp;pinctrl_gpid2=
_default&gt;;</div><div><br></div></div>After update and reboot platform I =
have same problem - front panel buttons dont enable (front panel buttons do=
nt enable if I use x86-power-control module or manually set gpio values by =
gpioset utility).</div><div dir=3D"ltr" data-setdir=3D"false">But if I dont=
 use any impacts on gpio (disable x86-power-control module and dont use gpi=
o utilities like gpioset/get) front panel buttons work well.</div><div dir=
=3D"ltr" data-setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data=
-setdir=3D"false"><span>What are your assumptions about this ?</span><br></=
div><div><br></div></div><br></div><div dir=3D"ltr" data-setdir=3D"false"><=
br></div><div dir=3D"ltr" data-setdir=3D"false">&nbsp;</div><div class=3D"y=
dp9b9df09esignature"><div dir=3D"ltr" style=3D"font-family:Helvetica, Arial=
, sans-serif;font-size:16px;"><div><span style=3D"font-family:Helvetica, Ar=
ial, sans-serif;">--</span><br clear=3D"none" style=3D"font-family:Helvetic=
a, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Arial, sans-se=
rif;">Best regards,</span><br clear=3D"none" style=3D"font-family:Helvetica=
, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Arial, sans-ser=
if;">Nikita Pavlov,</span><br clear=3D"none" style=3D"font-family:Helvetica=
, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Arial, sans-ser=
if;">NUST MISiS Student</span></div><br></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_1999625606" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 28 =D0=B0=
=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2022 =D0=B3., 23:01:13 GMT+3, Bills, Jason M=
 &lt;jason.m.bills@intel.com&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB=
(-=D0=B0):
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"yiv3781498404"><style><!--
#yiv3781498404 =20
 _filtered {}
 _filtered {}
 _filtered {}
#yiv3781498404 =20
#yiv3781498404 p.yiv3781498404MsoNormal, #yiv3781498404 li.yiv3781498404Mso=
Normal, #yiv3781498404 div.yiv3781498404MsoNormal
=09{margin:0in;font-size:11.0pt;font-family:"Calibri", sans-serif;}
#yiv3781498404 a:link, #yiv3781498404 span.yiv3781498404MsoHyperlink
=09{color:blue;text-decoration:underline;}
#yiv3781498404 span.yiv3781498404EmailStyle18
=09{font-family:"Calibri", sans-serif;color:windowtext;}
#yiv3781498404 .yiv3781498404MsoChpDefault
=09{font-size:10.0pt;}
 _filtered {}
#yiv3781498404 div.yiv3781498404WordSection1
=09{}
--></style><div>
<div class=3D"yiv3781498404WordSection1">
<p class=3D"yiv3781498404MsoNormal">Hi Nikita,</p>=20
<p class=3D"yiv3781498404MsoNormal"> &nbsp;</p>=20
<p class=3D"yiv3781498404MsoNormal">In the hardware, we have the power butt=
on routed through a GPIO pass-through on the Aspeed chip.&nbsp; If that pas=
s-through is disabled, it will prevent the physical front panel button sign=
al from getting past the BMC.&nbsp; That is the first thing
 I would check.</p>=20
<p class=3D"yiv3781498404MsoNormal"> &nbsp;</p>=20
<p class=3D"yiv3781498404MsoNormal">Also, it is better to send these kinds =
of questions to the OpenBMC mailing list as there may be others in the comm=
unity in a similar situation.</p>=20
<p class=3D"yiv3781498404MsoNormal"> &nbsp;</p>=20
<p class=3D"yiv3781498404MsoNormal">Thanks,</p>=20
<p class=3D"yiv3781498404MsoNormal">-Jason</p>=20
<p class=3D"yiv3781498404MsoNormal"> &nbsp;</p>=20
<div id=3D"yiv3781498404yqt39094" class=3D"yiv3781498404yqt5291788716"><div=
>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in;">
<p class=3D"yiv3781498404MsoNormal"><b>From:</b> Nikita Pavlov &lt;niikita@=
yahoo.com&gt; <br clear=3D"none">
<b>Sent:</b> Thursday, April 28, 2022 8:58 AM<br clear=3D"none">
<b>To:</b> Bills, Jason M &lt;jason.m.bills@intel.com&gt;; kuiying.wang@int=
el.com<br clear=3D"none">
<b>Subject:</b> x86-power-control question: front panel buttons dont work</=
p>=20
</div>
</div>
<p class=3D"yiv3781498404MsoNormal"> &nbsp;</p>=20
<div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;">Hi, I user x86-power-control module for my test intel pla=
tform. Its module works in webui but front panel physical buttons doesnt wo=
rk. I think that it interface describe
 in this fragment&nbsp;<a rel=3D"nofollow noopener noreferrer" shape=3D"rec=
t" target=3D"_blank" href=3D"https://github.com/openbmc/x86-power-control/b=
lob/master/src/power_control.cpp#L3072">https://github.com/openbmc/x86-powe=
r-control/blob/master/src/power_control.cpp#L3072</a>&nbsp;but I cant under=
stand this logic.</span></p>=20
</div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;">Say me pls, why
<span style=3D"color:black;">front panel&nbsp;</span>buttons dont work ?</s=
pan></p>=20
</div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;"> &nbsp;</span></p>=20
</div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;"> &nbsp;</span></p>=20
</div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;"> &nbsp;</span></p>=20
</div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;"> &nbsp;</span></p>=20
</div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;"> &nbsp;</span></p>=20
</div>
<div>
<div>
<div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;">--<br clear=3D"none">
Best regards,<br clear=3D"none">
Nikita Pavlov,<br clear=3D"none">
NUST MISiS Student</span></p>=20
</div>
<p class=3D"yiv3781498404MsoNormal"><span style=3D"font-size:12.0pt;font-fa=
mily:sans-serif;"> &nbsp;</span></p>=20
</div>
</div>
</div></div>
</div>
</div></div></div>
            </div>
        </div></body></html>
------=_Part_727720_1149676495.1651325136827--
