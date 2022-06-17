Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4F54F9B4
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 16:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPhvY39LGz3c7H
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 00:56:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=uDqxw6Rg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=77.238.176.206; helo=sonic306-20.consmr.mail.ir2.yahoo.com; envelope-from=niikita@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=uDqxw6Rg;
	dkim-atps=neutral
Received: from sonic306-20.consmr.mail.ir2.yahoo.com (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPhv426dbz308V
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 00:56:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655477768; bh=WxwIIbqTt2rlC8jvE8yPr9x9jPJ5lm7UdpEj75Zv4m0=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=uDqxw6RgA9X5855kZxuXNC0twG3w/CEQsRTl6V13OUr5QVzmGZQ+muUY1cq8GXhbq2wEPXOKUZVj3VIo+zZah92XPiygJeyJPbOdLS76+sbyQl7a2TCkJ6BpLl6j73XZOdHz9VLAcrOPYHVgL7j50wteE0D9GDAEmNqqgYMZzYRL3y3MVitvQeERVcEBIHgpfQC7Vp0mRH4vo+72tAxZvgEox1smvEjZkvXEC1op91edGK/GHZHM4eHdTue5aYi3p8ejfSZUui4toTcqFBEoj5tVTCxphNebeMkEcAeHmygTlpqBGuu3kcgR4QhFIzzV/wd+6m8rD9KiJaSo5m8QJw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655477768; bh=jbtHtFIpIrgZbfvtZ8ZoScEgTh45sB1CGd5D4phMbkw=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=RL6ghM5GbMbw3bpz3wGPDXefuS+p5ipwsMqFcvwo2bbRqbjIwlta+azOPY/KpmcMIAmfpGF1ZNwGy/xzG+aOrjKP+JmYMec72Qws6IbyDMOXHP7+trDa+vyhddpzjVwCNtN7JEq2BcWcy3hHMbKm06+/03xdg12C11IWtCeuRB/vuv3fytL9q3JtFByTKPGSU2ZAbEGzDu8k/M1XZOGH2pZvecnlQc/cCmtcuXF9yWLKe4Y1KqZ2PvDkWEuOlfeVrKWT4Kumyom9EK/42tzfiOZcetoNLFEqdHnlqTE+bwZVJQXY4zljjsFrjq73mufu4XllTTdRkvBcliIa/NyEcw==
X-YMail-OSG: gbYhFoEVM1kG_AuKgivAUBE2IVJH_60S8syhQDHwnc40mp21qbzfwvdBXqMDfe1
 UUcd8PTIT8g.SGmRbxdpY.7uphNQWkJi1SbUNsAf0O6ru7xl41DhbnIy53eWcsgPvNe_Wpxa_9Di
 M0zk8HlBgDKg6g5lBBWwTUedypHP47yTUmnrAJWGGZHETwO4ALMz.EWzeS.lIAiB2rUODKIzn_bk
 .81yyvY3jl_uuB58tS1D7p_RyMvlvcsOEoddlMHMKFBEV8ZljMR6NkxQoXz0LgnjX.weCnpY_9D6
 YozPo.5stY6BdJ6z26wTKvWxoEKA3HK3GmZWE1s86JvL1RL.M6QSwBITnHlT_TOkVuJRIi7M4nb0
 7Kialwsa1tVJY2qBbzpgHMr4hKAJJkcZxg0BvKyqmMaxjG.D5QIDtFxwv2bZQccfhaAhgMo0F0fb
 FVjbadGR78L2PnQZZg_n9KvYyvbh5oyW1F1tpUyej4diL_U9LXoIRe6Ns1PbPWKNqQXpmukGHS0u
 qhPAuCrEAzgS3.AcN.pYWw7qiJp19ifB1oEmdhx0FfFl57abelBhWJoNdZqpNMtwVXN4zIZvpnZg
 XtGyRwa8_1Jacozp1JHa5fb6puxpKDXdNVdpXwfJX0ZOyZ6Uo7eLGUIlp25Kq_HuLfKrRIkKb8P5
 sVrlajRts_KCyefNKNon3DC_h.BSeQ1piDXO_GRDhS_gWljnoahJOLHYSKRRKUo_9wBMjS1Rgg8k
 Rij5Q_dQdpGDJExGvjur8sHuuUpw.hWtMSriQB4NUWLqpME.GiZ9CKmxLOesgd98OFYjDlNhBjwG
 KwOGXzBzyEuQQpl46X34uAeExEGHivHsL6zWroahD8wVcRelrId9v9tsxpXBa.Ym_m_fJ8itDJn7
 oMYuT0U6RGekoFdIbp69uTtBrqm9CshGgLxexFBJv685_ZOfrm8wXn1Ku4JJgx2UtyyN61nwVCjR
 sbteVLn7fKK8N6yJLpLpbmLmwylwVJXl_KgNwtOkbsLq43V4Y4nkF0JpPvTxyAgWd7NFlh4B_X0S
 TmTkfPThDQQMhRlxaao3KAlASznoBvg4DlZp69Q_MfiM8l92HAlax3tIaX40n56PdVK8Si1QT5Oi
 1YzrUWRXTVgwZSY9UGpsenZu.4MDX2d2Ga4yB9EDE2y8i8weYn6jeaH__oZigrVLPdXa015tJhG5
 nVqMVUCBezSKGYdARO4QfPIlKiBJ0uJ0t7XDdjKLH0.eq9BieiIh6QUiFyNCP_0RHIWasc0XxSAY
 GdGc16iEJQ2NK5jB_EdIKfmYsnjP0Fe9JCi1HiKrXMZrJaJhY1u8GwzsIywVf9NLiK67Vv_ioeNV
 nZzGBzfJJpbDrvDn.708ZpqHZ_JI.Yj3HIHbb5ld2hKev8Uq5opPJa3CcpusPLiy77O40.J1yrSw
 dxVw9xNwvbkuGOKxyjKpu1YuVDARJgrG.2koatpn_JrCvvnPg1.JU5JsEtM8ESk0X.kE8BtADkVI
 kYXkdjlOxrwYik.0N0hbg.sQBpujnsITEH9ONgkBWxXYb2UV27ZKthtG4qaaSMTdiLKBpYi9gqzy
 1C27ZgeqmiClRL8cgxBV7ngMBw07XYIiPBXmLTIpX.FlMG5oqGmG_wVfoMkAzZ25nWNeEZFadZRA
 X.bVrxsLeTrE7A4luLLP5fTCjhNxLZF_QngXDGjOmFLKXNkTVQdmcGYxBgCoAszDSb5_gnj15IBU
 aW03SLmjXmDln5J5BZnEhsJnKyQjnoZauk4YXV_cYYUYGVEvzH3iVcBi1T9ByY4gEdmvKRytGqLG
 k0TK3A5.KYRn_aLuJFWw3Ks.9wGuc0KEz6OS66JsAr1Yid0su.bbXTXOcejCN3LRcGOPQEH7oKSm
 7g6mrvXReohbp_7ret9ZxZC3eDfKaoXSXytjEJdTdWnNSuxAU18q2S.8G_f4rJobAUqa6sMLYo_Q
 jRfV.H9gFH6SqeE0qLFS7a_llgymlRe_.9gkYidgqVVYuRVJoLkFUHzt9VyjhmH63_f6EruoN5MM
 j5cR3XN_rF1gkFpwvnksAT68bLQm9Y3__ZOlBnvPO5vLhWijUhp48AZYy28B_2udPOH13UAsNJsv
 QH2eOIfJhSILTAKQCsPCUE6LYRJH0E9wrxI4u3_OzhMsQrCGQy8Sjn2WTOm_J.CVJtjc.tpmclt.
 hFdQR8d9veYozUm0KQzZuGMWbywl5EcNc
X-Sonic-MF: <niikita@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Fri, 17 Jun 2022 14:56:08 +0000
Date: Fri, 17 Jun 2022 14:55:22 +0000 (UTC)
From: Nikita Pavlov <niikita@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <885011375.8771261.1655477722721@mail.yahoo.com>
In-Reply-To: <24b63477-119d-0d43-e494-4a79f0ad91fc@linux.intel.com>
References: <1790304102.3756861.1651157909253.ref@mail.yahoo.com> <1790304102.3756861.1651157909253@mail.yahoo.com> <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com> <667725503.727721.1651325136829@mail.yahoo.com> <93960ad8-105b-fc06-b5e8-a4f2c443c473@linux.intel.com> <1672954866.3142932.1652256355764@mail.yahoo.com> <24b63477-119d-0d43-e494-4a79f0ad91fc@linux.intel.com>
Subject: Re: x86-power-control question: front panel buttons dont work
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_8771260_1257232594.1655477722717"
X-Mailer: WebService/1.1.20280 YMailNorrin
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

------=_Part_8771260_1257232594.1655477722717
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,=C2=A0
I still have this problem. After power off board I cant run it from physica=
l buttons.Pass-through mode configured in kernel like CONFIG_ or=C2=A0it co=
mes as a kernel patch=C2=A0?

I have GPIOD0 power button=C2=A0GPIOD1 power out. Kernel show this debug in=
formation in sysfs=C2=A0/sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g=
5-pinctrl/pingroups:
group: GPID0pin 24 (F19)pin 25 (E21)
group: GPID2pin 26 (F20)pin 27 (D20)
group: GPID4pin 28 (D21)pin 29 (E20)
group: GPID6pin 30 (G18)pin 31 (C21)
group: GPIE0pin 32 (B20)pin 33 (C20)
group: GPIE2pin 34 (F18)pin 35 (F17)......
I cant understand what it mean but in this debug file among all gpios there=
 are only GPIOD and GPIOE gpio banks.


--
Best regards,
Nikita Pavlov,
NUST MISiS Student
=20

    =D1=81=D1=80=D0=B5=D0=B4=D0=B0, 8 =D0=B8=D1=8E=D0=BD=D1=8F 2022 =D0=B3.=
, 18:04:16 GMT+3, Bills, Jason M <jason.m.bills@linux.intel.com> =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=B0): =20
=20
 Hi Nikita,

Sorry for the delay on this as I was on leave.=C2=A0 Did this get resolved?

On 5/11/2022 2:05 AM, Nikita Pavlov wrote:
> Hi Jason,
>=20
> Front panel stop working from there until the next reboot even after=20
> stopping gpioset.
It sounds like something in the pinctrl muxing is not behaving as expected.

Do you use Aspeed?=C2=A0 What version of Aspeed chip are you using? (This=
=20
will help find the pinctrl info in the kernel which is hardware-specific.)

>=20
> I test it with getting POWER_OUT line value and then released line like=
=20
> this:
>=20
> #include <gpiod.hpp>
>=20
> #include <iostream>
>=20
> int main(int argc, char** argv)
> {
>=C2=A0 =C2=A0 =C2=A0 gpiod::line line =3D gpiod::find_line("POWER_OUT");
>=C2=A0 =C2=A0 =C2=A0 if (!line)
>=C2=A0 =C2=A0 =C2=A0 {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::cerr << "find line error\n";
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
>=C2=A0 =C2=A0 =C2=A0 }
>=20
>=C2=A0 =C2=A0 =C2=A0 try
>=C2=A0 =C2=A0 =C2=A0 {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line.request({"pwr", gpiod::line_reques=
t::EVENT_BOTH_EDGES, {}});
>=C2=A0 =C2=A0 =C2=A0 }
>=C2=A0 =C2=A0 =C2=A0 catch (const std::exception& ec)
>=C2=A0 =C2=A0 =C2=A0 {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::cerr << ec.what();
>=C2=A0 =C2=A0 =C2=A0 }
>=20
>=C2=A0 =C2=A0 =C2=A0 int state =3D line.get_value();
>=C2=A0 =C2=A0 =C2=A0 std::cout << state << '\n';
>=C2=A0 =C2=A0 =C2=A0 line.release();
>=20
>=C2=A0 =C2=A0 =C2=A0 return 0;
> }
>=20
>=20
> But front panel button also doesnt work with getting value.
>=20
> --
> Best regards,
> Nikita Pavlov,
> NUST MISiS Student
>=20
>=20
>=20
> =D0=BF=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA, 2 =D0=
=BC=D0=B0=D1=8F 2022 =D0=B3., 18:36:24 GMT+3, Bills, Jason M=20
> <jason.m.bills@linux.intel.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB(-=D0=B0):
>=20
>=20
> Hi Nikita,
>=20
> On 4/30/2022 7:25 AM, Nikita Pavlov wrote:
>=C2=A0 > Hi Jason, thank you for your response. In my platform I have
>=C2=A0 > power-control gpios in GPIOD group like this:
>=C2=A0 >
>=C2=A0 > /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
>=C2=A0 >
>=C2=A0 > Also I configurate pass-through mode in dts:
>=C2=A0 >
>=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D "pass-through=
";
>=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D <&pinctrl_gpid0_d=
efault
>=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpid2_default>;
>=20
> Could you please share what is your BMC hardware version?
>=C2=A0 >
>=C2=A0 > After update and reboot platform I have same problem - front pane=
l
>=C2=A0 > buttons dont enable (front panel buttons dont enable if I use
>=C2=A0 > x86-power-control module or manually set gpio values by gpioset u=
tility).
>=C2=A0 > But if I dont use any impacts on gpio (disable x86-power-control =
module
>=C2=A0 > and dont use gpio utilities like gpioset/get) front panel buttons=
=20
> work well.
>=C2=A0 >
>=C2=A0 > What are your assumptions about this ?
>=20
> The pass-through is set up as a mux in pinctrl.=C2=A0 If I remember
> correctly, the output pin has GPIO output and pass-through mode as two
> different options in the pinctrl mux.
>=20
> So, when you request the output pin using libgpiod, it automatically
> configures the pinctrl to disable the pass-through. You should be able
> to re-enable pass-through by simply releasing control of the output pin
> in libgpiod.
>=20
> For simplicity, let's work with just the gpioset utility and not use
> x86-power-control.=C2=A0 So, when you initially boot, the pass-through is
> working. You then use gpioset to change the output pin (which will
> switch the pinctrl mux and disable pass-through mode causing the front
> panel to stop working). When you stop gpioset, it should release the
> gpio and switch the mux back to enable pass-through mode for the front
> panel to work again.
>=20
> In your test does the front panel start working again after stopping
> gpioset? Or does the front panel stop working from there until the next
> reboot even after stopping gpioset?
>=20
> Thanks,
>=20
> -Jason
>=20
>=C2=A0 >
>=C2=A0 >
>=C2=A0 >
>=C2=A0 > --
>=C2=A0 > Best regards,
>=C2=A0 > Nikita Pavlov,
>=C2=A0 > NUST MISiS Student
>=C2=A0 >
>=C2=A0 >
>=C2=A0 >
>=C2=A0 > =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 28 =D0=B0=D0=BF=D1=80=
=D0=B5=D0=BB=D1=8F 2022 =D0=B3., 23:01:13 GMT+3, Bills, Jason M
>=C2=A0 > <jason.m.bills@intel.com <mailto:jason.m.bills@intel.com>> =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=B0):
>=C2=A0 >
>=C2=A0 >
>=C2=A0 > Hi Nikita,
>=C2=A0 >
>=C2=A0 > In the hardware, we have the power button routed through a GPIO
>=C2=A0 > pass-through on the Aspeed chip.=C2=A0 If that pass-through is di=
sabled, it
>=C2=A0 > will prevent the physical front panel button signal from getting =
past
>=C2=A0 > the BMC.=C2=A0 That is the first thing I would check.
>=C2=A0 >
>=C2=A0 > Also, it is better to send these kinds of questions to the OpenBM=
C
>=C2=A0 > mailing list as there may be others in the community in a similar=
=20
> situation.
>=C2=A0 >
>=C2=A0 > Thanks,
>=C2=A0 >
>=C2=A0 > -Jason
>=C2=A0 >
>=C2=A0 > *From:* Nikita Pavlov <niikita@yahoo.com <mailto:niikita@yahoo.co=
m>>
>=C2=A0 > *Sent:* Thursday, April 28, 2022 8:58 AM
>=C2=A0 > *To:* Bills, Jason M <jason.m.bills@intel.com=20
> <mailto:jason.m.bills@intel.com>>; kuiying.wang@intel.com=20
> <mailto:kuiying.wang@intel.com>
>=C2=A0 > *Subject:* x86-power-control question: front panel buttons dont w=
ork
>=C2=A0 >
>=C2=A0 > Hi, I user x86-power-control module for my test intel platform. I=
ts
>=C2=A0 > module works in webui but front panel physical buttons doesnt wor=
k. I
>=C2=A0 > think that it interface describe in this fragment
>=C2=A0 >=20
> https://github.com/openbmc/x86-power-control/blob/master/src/power_contro=
l.cpp#L3072=20
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_contr=
ol.cpp#L3072=20
>=C2=A0 >
>=C2=A0 >=20
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_contr=
ol.cpp#L3072=20
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_contr=
ol.cpp#L3072>>=C2=A0but=20
>=20
>=C2=A0 > I cant understand this logic.
>=C2=A0 >
>=C2=A0 > Say me pls, why front panel buttons dont work ?
>=C2=A0 >
>=C2=A0 > --
>=C2=A0 > Best regards,
>=C2=A0 > Nikita Pavlov,
>=C2=A0 > NUST MISiS Student
>=C2=A0 >
 =20
------=_Part_8771260_1257232594.1655477722717
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp4583c686yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Hi Jason,&nbsp;</div><div di=
r=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"f=
alse"><span>I still have this problem. After power off board I cant run it =
from physical buttons.</span></div><div dir=3D"ltr" data-setdir=3D"false">P=
ass-through mode configured in kernel like CONFIG_ or&nbsp;it comes as a ke=
rnel patch&nbsp;?<br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div=
><div dir=3D"ltr" data-setdir=3D"false"><span>I have GPIOD0 <span><span sty=
le=3D"color: rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif; font-size: 16px;">power button&nbsp;</span></span>GPIOD1 power o=
ut. Kernel show this debug information in sysfs&nbsp;<span>/sys/kernel/debu=
g/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pingroups:</span></span></div>=
<div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setd=
ir=3D"false"><span><div><div>group: GPID0</div><div>pin 24 (F19)</div><div>=
pin 25 (E21)</div><div><br></div><div>group: GPID2</div><div>pin 26 (F20)</=
div><div>pin 27 (D20)</div><div><br></div><div>group: GPID4</div><div>pin 2=
8 (D21)</div><div>pin 29 (E20)</div><div><br></div><div>group: GPID6</div><=
div>pin 30 (G18)</div><div>pin 31 (C21)</div><div><br></div><div>group: GPI=
E0</div><div>pin 32 (B20)</div><div>pin 33 (C20)</div><div><br></div><div>g=
roup: GPIE2</div><div>pin 34 (F18)</div><div>pin 35 (F17)</div></div><div>.=
.....</div><div><br></div></span></div><div dir=3D"ltr" data-setdir=3D"fals=
e">I cant understand what it mean but in this debug file among all gpios th=
ere are only GPIOD and GPIOE gpio banks.</div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div =
dir=3D"ltr" data-setdir=3D"false"><br></div><div class=3D"ydp4583c686signat=
ure"><div dir=3D"ltr" style=3D"font-family:Helvetica, Arial, sans-serif;fon=
t-size:16px;"><div><span style=3D"font-family:Helvetica, Arial, sans-serif;=
">--</span><br clear=3D"none" style=3D"font-family:Helvetica, Arial, sans-s=
erif;"><span style=3D"font-family:Helvetica, Arial, sans-serif;">Best regar=
ds,</span><br clear=3D"none" style=3D"font-family:Helvetica, Arial, sans-se=
rif;"><span style=3D"font-family:Helvetica, Arial, sans-serif;">Nikita Pavl=
ov,</span><br clear=3D"none" style=3D"font-family:Helvetica, Arial, sans-se=
rif;"><span style=3D"font-family:Helvetica, Arial, sans-serif;">NUST MISiS =
Student</span></div><br></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_5601818569" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    =D1=81=D1=80=D0=B5=D0=B4=D0=B0, 8 =D0=B8=D1=8E=D0=BD=D1=
=8F 2022 =D0=B3., 18:04:16 GMT+3, Bills, Jason M &lt;jason.m.bills@linux.in=
tel.com&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=B0):
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">Hi Nikita,<br clear=3D"none"><br clea=
r=3D"none">Sorry for the delay on this as I was on leave.&nbsp; Did this ge=
t resolved?<br clear=3D"none"><br clear=3D"none">On 5/11/2022 2:05 AM, Niki=
ta Pavlov wrote:<br clear=3D"none">&gt; Hi Jason,<br clear=3D"none">&gt; <b=
r clear=3D"none">&gt; Front panel stop working from there until the next re=
boot even after <br clear=3D"none">&gt; stopping gpioset.<br clear=3D"none"=
>It sounds like something in the pinctrl muxing is not behaving as expected=
.<br clear=3D"none"><br clear=3D"none">Do you use Aspeed?&nbsp; What versio=
n of Aspeed chip are you using? (This <br clear=3D"none">will help find the=
 pinctrl info in the kernel which is hardware-specific.)<br clear=3D"none">=
<br clear=3D"none">&gt; <br clear=3D"none">&gt; I test it with getting POWE=
R_OUT line value and then released line like <br clear=3D"none">&gt; this:<=
br clear=3D"none">&gt; <br clear=3D"none">&gt; #include &lt;gpiod.hpp&gt;<b=
r clear=3D"none">&gt; <br clear=3D"none">&gt; #include &lt;iostream&gt;<br =
clear=3D"none">&gt; <br clear=3D"none">&gt; int main(int argc, char** argv)=
<br clear=3D"none">&gt; {<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; gpiod:=
:line line =3D gpiod::find_line("POWER_OUT");<br clear=3D"none">&gt;&nbsp; =
&nbsp; &nbsp; if (!line)<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; {<br cl=
ear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; std::cerr &lt;&lt; "fin=
d line error\n";<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r=
eturn -1;<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; }<br clear=3D"none">&g=
t; <br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; try<br clear=3D"none">&gt;&n=
bsp; &nbsp; &nbsp; {<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; line.request({"pwr", gpiod::line_request::EVENT_BOTH_EDGES, {}});<br cle=
ar=3D"none">&gt;&nbsp; &nbsp; &nbsp; }<br clear=3D"none">&gt;&nbsp; &nbsp; =
&nbsp; catch (const std::exception&amp; ec)<br clear=3D"none">&gt;&nbsp; &n=
bsp; &nbsp; {<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; std:=
:cerr &lt;&lt; ec.what();<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; }<br c=
lear=3D"none">&gt; <br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; int state =
=3D line.get_value();<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; std::cout =
&lt;&lt; state &lt;&lt; '\n';<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; li=
ne.release();<br clear=3D"none">&gt; <br clear=3D"none">&gt;&nbsp; &nbsp; &=
nbsp; return 0;<br clear=3D"none">&gt; }<br clear=3D"none">&gt; <br clear=
=3D"none">&gt; <br clear=3D"none">&gt; But front panel button also doesnt w=
ork with getting value.<br clear=3D"none">&gt; <br clear=3D"none">&gt; --<b=
r clear=3D"none">&gt; Best regards,<br clear=3D"none">&gt; Nikita Pavlov,<b=
r clear=3D"none">&gt; NUST MISiS Student<br clear=3D"none">&gt; <br clear=
=3D"none">&gt; <br clear=3D"none">&gt; <br clear=3D"none">&gt; =D0=BF=D0=BE=
=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA, 2 =D0=BC=D0=B0=D1=
=8F 2022 =D0=B3., 18:36:24 GMT+3, Bills, Jason M <br clear=3D"none">&gt; &l=
t;<a shape=3D"rect" ymailto=3D"mailto:jason.m.bills@linux.intel.com" href=
=3D"mailto:jason.m.bills@linux.intel.com">jason.m.bills@linux.intel.com</a>=
&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=B0):<br clear=3D"none"=
>&gt; <br clear=3D"none">&gt; <br clear=3D"none">&gt; Hi Nikita,<br clear=
=3D"none">&gt; <br clear=3D"none">&gt; On 4/30/2022 7:25 AM, Nikita Pavlov =
wrote:<br clear=3D"none">&gt;&nbsp; &gt; Hi Jason, thank you for your respo=
nse. In my platform I have<br clear=3D"none">&gt;&nbsp; &gt; power-control =
gpios in GPIOD group like this:<br clear=3D"none">&gt;&nbsp; &gt;<br clear=
=3D"none">&gt;&nbsp; &gt; /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTO=
N","RESET_OUT",<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nb=
sp; &gt; Also I configurate pass-through mode in dts:<br clear=3D"none">&gt=
;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; pinctrl-names =3D "pass-through";<br clear=3D"none">&gt;&nbsp; &gt;&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_gpid0_defau=
lt<br clear=3D"none">&gt;&nbsp; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&amp;pinctrl_gpid2_default&gt;;<br clear=3D"none">&gt; <br clear=3D"none">=
&gt; Could you please share what is your BMC hardware version?<br clear=3D"=
none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt; After update and re=
boot platform I have same problem - front panel<br clear=3D"none">&gt;&nbsp=
; &gt; buttons dont enable (front panel buttons dont enable if I use<br cle=
ar=3D"none">&gt;&nbsp; &gt; x86-power-control module or manually set gpio v=
alues by gpioset utility).<br clear=3D"none">&gt;&nbsp; &gt; But if I dont =
use any impacts on gpio (disable x86-power-control module<br clear=3D"none"=
>&gt;&nbsp; &gt; and dont use gpio utilities like gpioset/get) front panel =
buttons <br clear=3D"none">&gt; work well.<br clear=3D"none">&gt;&nbsp; &gt=
;<br clear=3D"none">&gt;&nbsp; &gt; What are your assumptions about this ?<=
br clear=3D"none">&gt; <br clear=3D"none">&gt; The pass-through is set up a=
s a mux in pinctrl.&nbsp; If I remember<br clear=3D"none">&gt; correctly, t=
he output pin has GPIO output and pass-through mode as two<br clear=3D"none=
">&gt; different options in the pinctrl mux.<br clear=3D"none">&gt; <br cle=
ar=3D"none">&gt; So, when you request the output pin using libgpiod, it aut=
omatically<br clear=3D"none">&gt; configures the pinctrl to disable the pas=
s-through. You should be able<br clear=3D"none">&gt; to re-enable pass-thro=
ugh by simply releasing control of the output pin<br clear=3D"none">&gt; in=
 libgpiod.<br clear=3D"none">&gt; <br clear=3D"none">&gt; For simplicity, l=
et's work with just the gpioset utility and not use<br clear=3D"none">&gt; =
x86-power-control.&nbsp; So, when you initially boot, the pass-through is<b=
r clear=3D"none">&gt; working. You then use gpioset to change the output pi=
n (which will<br clear=3D"none">&gt; switch the pinctrl mux and disable pas=
s-through mode causing the front<br clear=3D"none">&gt; panel to stop worki=
ng). When you stop gpioset, it should release the<br clear=3D"none">&gt; gp=
io and switch the mux back to enable pass-through mode for the front<br cle=
ar=3D"none">&gt; panel to work again.<br clear=3D"none">&gt; <br clear=3D"n=
one">&gt; In your test does the front panel start working again after stopp=
ing<br clear=3D"none">&gt; gpioset? Or does the front panel stop working fr=
om there until the next<br clear=3D"none">&gt; reboot even after stopping g=
pioset?<br clear=3D"none">&gt; <br clear=3D"none">&gt; Thanks,<br clear=3D"=
none">&gt; <br clear=3D"none">&gt; -Jason<br clear=3D"none">&gt; <br clear=
=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"non=
e">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt; --<br clear=3D"none">&=
gt;&nbsp; &gt; Best regards,<br clear=3D"none">&gt;&nbsp; &gt; Nikita Pavlo=
v,<br clear=3D"none">&gt;&nbsp; &gt; NUST MISiS Student<br clear=3D"none">&=
gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbs=
p; &gt;<br clear=3D"none">&gt;&nbsp; &gt; =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=
=80=D0=B3, 28 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2022 =D0=B3., 23:01:13 G=
MT+3, Bills, Jason M<br clear=3D"none">&gt;&nbsp; &gt; &lt;<a shape=3D"rect=
" ymailto=3D"mailto:jason.m.bills@intel.com" href=3D"mailto:jason.m.bills@i=
ntel.com">jason.m.bills@intel.com</a> &lt;mailto:<a shape=3D"rect" ymailto=
=3D"mailto:jason.m.bills@intel.com" href=3D"mailto:jason.m.bills@intel.com"=
>jason.m.bills@intel.com</a>&gt;&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BB(-=D0=B0):<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&n=
bsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt; Hi Nikita,<br clear=3D"none">&g=
t;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt; In the hardware, we have th=
e power button routed through a GPIO<br clear=3D"none">&gt;&nbsp; &gt; pass=
-through on the Aspeed chip.&nbsp; If that pass-through is disabled, it<br =
clear=3D"none">&gt;&nbsp; &gt; will prevent the physical front panel button=
 signal from getting past<br clear=3D"none">&gt;&nbsp; &gt; the BMC.&nbsp; =
That is the first thing I would check.<br clear=3D"none">&gt;&nbsp; &gt;<br=
 clear=3D"none">&gt;&nbsp; &gt; Also, it is better to send these kinds of q=
uestions to the OpenBMC<br clear=3D"none">&gt;&nbsp; &gt; mailing list as t=
here may be others in the community in a similar <br clear=3D"none">&gt; si=
tuation.<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &gt=
; Thanks,<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &g=
t; -Jason<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &g=
t; *From:* Nikita Pavlov &lt;<a shape=3D"rect" ymailto=3D"mailto:niikita@ya=
hoo.com" href=3D"mailto:niikita@yahoo.com">niikita@yahoo.com</a> &lt;mailto=
:<a shape=3D"rect" ymailto=3D"mailto:niikita@yahoo.com" href=3D"mailto:niik=
ita@yahoo.com">niikita@yahoo.com</a>&gt;&gt;<br clear=3D"none">&gt;&nbsp; &=
gt; *Sent:* Thursday, April 28, 2022 8:58 AM<br clear=3D"none">&gt;&nbsp; &=
gt; *To:* Bills, Jason M &lt;<a shape=3D"rect" ymailto=3D"mailto:jason.m.bi=
lls@intel.com" href=3D"mailto:jason.m.bills@intel.com">jason.m.bills@intel.=
com</a> <br clear=3D"none">&gt; &lt;mailto:<a shape=3D"rect" ymailto=3D"mai=
lto:jason.m.bills@intel.com" href=3D"mailto:jason.m.bills@intel.com">jason.=
m.bills@intel.com</a>&gt;&gt;; <a shape=3D"rect" ymailto=3D"mailto:kuiying.=
wang@intel.com" href=3D"mailto:kuiying.wang@intel.com">kuiying.wang@intel.c=
om</a> <br clear=3D"none">&gt; &lt;mailto:<a shape=3D"rect" ymailto=3D"mail=
to:kuiying.wang@intel.com" href=3D"mailto:kuiying.wang@intel.com">kuiying.w=
ang@intel.com</a>&gt;<div class=3D"yqt1021942522" id=3D"yqtfd63322"><br cle=
ar=3D"none">&gt;&nbsp; &gt; *Subject:* x86-power-control question: front pa=
nel buttons dont work<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&=
gt;&nbsp; &gt; Hi, I user x86-power-control module for my test intel platfo=
rm. Its<br clear=3D"none">&gt;&nbsp; &gt; module works in webui but front p=
anel physical buttons doesnt work. I<br clear=3D"none">&gt;&nbsp; &gt; thin=
k that it interface describe in this fragment<br clear=3D"none">&gt;&nbsp; =
&gt; <br clear=3D"none">&gt; <a shape=3D"rect" href=3D"https://github.com/o=
penbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 " target=
=3D"_blank">https://github.com/openbmc/x86-power-control/blob/master/src/po=
wer_control.cpp#L3072 </a><br clear=3D"none">&gt; &lt;<a shape=3D"rect" hre=
f=3D"https://github.com/openbmc/x86-power-control/blob/master/src/power_con=
trol.cpp#L3072 " target=3D"_blank">https://github.com/openbmc/x86-power-con=
trol/blob/master/src/power_control.cpp#L3072 </a><br clear=3D"none">&gt;&nb=
sp; &gt;<br clear=3D"none">&gt;&nbsp; &gt; <br clear=3D"none">&gt; &lt;<a s=
hape=3D"rect" href=3D"https://github.com/openbmc/x86-power-control/blob/mas=
ter/src/power_control.cpp#L3072 " target=3D"_blank">https://github.com/open=
bmc/x86-power-control/blob/master/src/power_control.cpp#L3072 </a><br clear=
=3D"none">&gt; &lt;<a shape=3D"rect" href=3D"https://github.com/openbmc/x86=
-power-control/blob/master/src/power_control.cpp#L3072" target=3D"_blank">h=
ttps://github.com/openbmc/x86-power-control/blob/master/src/power_control.c=
pp#L3072</a>&gt;&gt;&nbsp;but <br clear=3D"none">&gt; <br clear=3D"none">&g=
t;&nbsp; &gt; I cant understand this logic.<br clear=3D"none">&gt;&nbsp; &g=
t;<br clear=3D"none">&gt;&nbsp; &gt; Say me pls, why front panel buttons do=
nt work ?<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none">&gt;&nbsp; &g=
t; --<br clear=3D"none">&gt;&nbsp; &gt; Best regards,<br clear=3D"none">&gt=
;&nbsp; &gt; Nikita Pavlov,<br clear=3D"none">&gt;&nbsp; &gt; NUST MISiS St=
udent<br clear=3D"none">&gt;&nbsp; &gt;<br clear=3D"none"></div></div></div=
>
            </div>
        </div></body></html>
------=_Part_8771260_1257232594.1655477722717--
