Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90965F7863
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 14:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkSxN4rzfz3dq3
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 23:56:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=sdlxvehp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.128.206; helo=sonic320-25.consmr.mail.bf2.yahoo.com; envelope-from=erhan14@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=sdlxvehp;
	dkim-atps=neutral
Received: from sonic320-25.consmr.mail.bf2.yahoo.com (sonic320-25.consmr.mail.bf2.yahoo.com [74.6.128.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkSwn5WVzz2yZK
	for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2022 23:56:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1665147362; bh=jifl8A0GYDyesf8TKLlJaePX6sTkSf+Grcgv4oBdGhU=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=sdlxvehpUYcp5XButGiM4z+LdAfHN11gHdHbtrVcKS3XujxQUxK2CSl56ieQHTfkaj9kVoOlnqsO8oV/rCKsAWaB1uEWGRo6QIq/KjY0CJX6HIley3SFb/Cyu/bnejISKRGZ68bRspLzdx48Teu1xYna3DHj2irSxtEh/0Y/MXf2Yn1kGuPOokTlleauuYu2rWdIVCIx7H9VVlXfExC5d3IWArbo9gvFCURoRNNSDZ7aMW8LTeHkpMW6f1Eai3NalDimtcl0xD/1IKcb/5MUOzk1suNdI+4mThHXQum5a+i3NVyWtaJymykgoq9hsmbwcb7YwevBjg45ZswUOueMYg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1665147362; bh=3GUzPNMXWiu4j/ghMEymnae6r808MVfR5C7CtUXltP5=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=GkgrZynZUOnHLtxOHTIVcZvDcQIGH9oFyZOSHX8DRpCOczF+D+vlX7GnVHR5F44HXo9tw7vkC+8iqXa2cN/DUgPRwO3k23j2zNVLHzagCph2Fa03Ljl5F1rmYQxg/63d3C4cQn+KNdhfEYLILvpNkF8XGpjyRRcEE0uXv4ildkcjtfnRcHpk2b6UUaQlwxuXsfqAveClv6V+zNlzFOt0Nxqc8DLorQCSQsbCfkRNd/x53ufSh1TruDak7L6XF/w6OJSskfnCtYsSFvk11pQc/PJevNwSvdNQuorLPa3mljUnb/BOL3xnpla11A2f7tfluW91mzW1np+8w76VnoLEVw==
X-YMail-OSG: qz9lMjMVM1lB3aLBIp60ihG8GghYi0XxpEvEkZAEB.su5nmzyFNSno47IwK_bJG
 DIwDlDFsrpFBzrHF_SfLfqvE1r.YjiR2wEI9abNkMF4EfhQ54yE54XshVIW1wiaTy2gLbt8xPBlC
 oa4hcQGwUgfwKlnC_9KDrqEmwczqpnA0DKRLDm0E_2JbFTH1CU8V9x6UrS6vfyqP0Pqpf63T2LJS
 8y37lSZL8m0K_DtvWnO4QL.7wzKggpHmaShP7QqA5eNNvxtbWDQfQqujUxCoIQ519stRURjTIGnQ
 7jcYe6KXx9DVKJLSxQw4mePrCAAeH3SixGTMMuMtZYOKSp9_hu3qyMkMRevdGzo.MyvLvd7tCXDv
 23huoHbdJFa.ZY0f5YPnNyrCOu.1ec31DeQcqb3kcpTT0MoxFp4m.j6NGkH.mm.URoS3Oba32w.J
 0jTgx4tEGf8hE.9dUoQZzGWvZw4928QqhiNYlqF1QAlG8WSe4QwYUDRvfN96tgJVQagsJEnB4xbl
 r9cwHMsZJD42wx0F6qI_9VRAzQ0sqL1O0Uiz9utC3eFl6RKLOxd77VYo.ARO.dBVS8.jaUqor56.
 hpcg.NxifUhq.XWxwxtlEZwRB1wyt28YJ5OvtTYiiMIa3kZ2DpThMP2LLQcZeGHi2AKVoPs9H5La
 Bl3.vvUAcDKAsdnKoE00aQBeDBSxDoFJRYH_FgL66Sf3rbto_.jm1TaNpN7v5sVO79cvyEuUDeMD
 D7YsGyKDY3hfZWlvFHiixZb1wdzu04R8KimSkV8Z0E7Ij6uEiV0bOenmhZsS8Kuc3AuLQ9ePwGFu
 Evldi98lWQfOCchxekk3SU0IQUoP3JRtiVqIN.oPGxx1oX2YniKnByukx4MY0JvfqjmjoHZHaWLv
 n1F_y6KVpnGLjqiY9S_c0E4htSdU1oSyFVFYEKtSVkBZEEqaM.Aao8aIZhATcEgoB5qDAa_J3kRx
 pzn3mfCBMtfyCdQWFZiloEczH8UQjBBLZlXI78HZtbvn54meZrBjqcPKYS98IV1Im7k14eCw7VE0
 _jO0MLXJ0p2ABTk4lqP1Uuz6nrOwNWH98du_T6dARDLPfmuV1kUF2iglbQ_O9.ZnOkZh9hA0gopV
 sNvsuE0FVtiesmkAIyO38b4R.7swFyETGwp6bNsE5LR.QvpoyISbv3MwibBvNaiB6esVTv2n4R6j
 cs.fRTCeGhVCp8zgs0x23avqWYnUmcsrNgTrb5dfL90RQulyEFVx9fVYJgMzcM2OyUrmANjQ1_DB
 FqF.WxHoLGxoHZQndK4aeC0CDzljnFCFRjBnncJLcziiSnNdIcT3quK.ZZvCBWmQNCxGGqi.Za_f
 Jxgw_E48ppo0hvHM5NfrhSXLfEORgfliGFPgt.Aa5BAojUDKytGIRle1NXAHTNgCHmewphhel2mA
 _dihc9bbRR4qAtV0hni8YvLrQpwBEaGok7XiN5b7z6tPJjPDYz7kQA7AL88NwAd2n.hj7_3zOkfY
 eu_.Qm0GM2q..y2cdQ2gpAKTnAvdwSuWozdQl0GMts5UKTjuQ_T.LJSQBup3zYLBNnZCfAeURTq0
 NwLG7AMKUvMCkvlAT5Zc57Jctg53K.nVcDwMeJmo7GIOEKfeg56sWF7RxX0f1t8Xt.vuV3Ru6raJ
 XcNe8euS66uAcBIdWRvEpIcgAGg1JQ93Uii2_jKK.FCDH7Jr0FMoGvsLUgGZnnMbMwinF3KsIVqF
 SVRW3AJ8Q7JQ8.peAhdAEiKV0x_9tb0_FGD.vCN_LNock.O2WTE.oA8V68cHCvK1HSGAXyJ4BhsY
 IetlN9EfZtlzKbw1K.bHzRbzrR0nbDSXQ7pjWWYS4YguJUOVJgs7H8wjfSyjH5XUTTQ5FnZi2rK0
 weolESQjkpU4NHMAlF3Fzq9f7vJHSNiMbruRJU.zz_QO4qBio6_DP66Q1FuvUIGubuhME_A6QcNn
 I2dl9g5m1xl2s2ak0TtG9RSVhb5BPFSe7o..ID7af3aF1x_5eTFWWSwS..kEI.m7XV34X0bUUkE7
 CrP_cC2ao69bFhJqV3JsOqkdorurOY6OcpEiyNx_2AKBmzAZ_YUVEMyKAgepb8fz9fNNBv4eMdJT
 WVwRTIvcbMoggfNzb7KLx3Ed9sfCJuOAgDALBLxTiHEwnIbWA_JdQUQkwVC4vltqC.k37F6qfhsS
 LLv1oEuSSBOx9VIwm.UnQFD8TrY0c5L7d4pHEE5BvTIVCpzJ1o3J8pH0J0kPGyA.wBBHnJOejd6J
 jjA--
X-Sonic-MF: <erhan14@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic320.consmr.mail.bf2.yahoo.com with HTTP; Fri, 7 Oct 2022 12:56:02 +0000
Date: Fri, 7 Oct 2022 12:56:02 +0000 (UTC)
From: "Erhan Y." <erhan14@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <2116344159.3312599.1665147362407@mail.yahoo.com>
Subject: ipmi kcs problem
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3312598_1035994222.1665147362405"
References: <2116344159.3312599.1665147362407.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20702 YMailNorrin
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

------=_Part_3312598_1035994222.1665147362405
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,We are trying to get SMBIOS tables from host on BMC (ast-2500). KCS#3 is=
 enabled in DTS (with address CA2) and on the host side IPMI_SI driver init=
ialization fails.What can be wrong in our setup? What are to required steps=
 to get the SMBIOS tables from the host?
Host Logs:[=C2=A0 =C2=A0 7.796852] ipmi_si: IPMI System Interface driver[=
=C2=A0 =C2=A0 7.796893] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via S=
MBIOS[=C2=A0 =C2=A0 7.796900] ipmi_platform: ipmi_si: SMBIOS: io 0xca2 regs=
ize 1 spacing 1 irq 0[=C2=A0 =C2=A0 7.796905] ipmi_si: Adding SMBIOS-specif=
ied kcs state machine[=C2=A0 =C2=A0 7.797140] ipmi_si: Trying SMBIOS-specif=
ied kcs state machine at i/o address 0xca2, slave address 0x20, irq 0[=C2=
=A0 =C2=A0 7.797152] ipmi_si dmi-ipmi-si.0: Interface detection failed

BMC Logs:=C2=A0[=C2=A0 =C2=A0 0.301014] ast-kcs-bmc 1e78902c.kcs: Initialis=
ed IPMI client for channel 3[=C2=A0 =C2=A0 0.301085] ast-kcs-bmc 1e78902c.k=
cs: Initialised channel 3 at 0xca2[=C2=A0 =C2=A022.521031] systemd[1]: Crea=
ted slice Slice /system/phosphor-ipmi-kcs.

=C2=A0systemctl status phosphor-ipmi-kcs@ipmi-kcs3=E2=97=8F phosphor-ipmi-k=
cs@ipmi-kcs3.service - Phosphor IPMI KCS DBus Bridge=C2=A0 =C2=A0 =C2=A0Loa=
ded: loaded (/lib/systemd/system/phosphor-ipmi-kcs@.service; enabled; vendo=
r preset: disabled)=C2=A0 =C2=A0 =C2=A0Active: active (running) since Thu 1=
970-01-01 00:01:54 UTC; 24min ago=C2=A0 =C2=A0Main PID: 443 (kcsbridged)=C2=
=A0 =C2=A0 =C2=A0CGroup: /system.slice/system-phosphor\x2dipmi\x2dkcs.slice=
/phosphor-ipmi-kcs@ipmi-kcs3.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E2=94=94=E2=94=80 443 /usr/libexec/kcsbridged -c ipmi-kcs3
Jan 01 00:01:53 Aselsan-Server systemd[1]: Starting Phosphor IPMI KCS DBus =
Bridge...Jan 01 00:01:54 Aselsan-Server systemd[1]: Started Phosphor IPMI K=
CS DBus Bridge.



------=_Part_3312598_1035994222.1665147362405
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hi,</div><div dir=3D"ltr" data-setdir=3D"fal=
se">We are trying to get SMBIOS tables from host on BMC (ast-2500). KCS#3 i=
s enabled in DTS (with address CA2) and on the host side IPMI_SI driver ini=
tialization fails.</div><div dir=3D"ltr" data-setdir=3D"false">What can be =
wrong in our setup? What are to required steps to get the SMBIOS tables fro=
m the host?</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=
=3D"ltr" data-setdir=3D"false">Host Logs:</div><div dir=3D"ltr" data-setdir=
=3D"false"><div><div>[&nbsp; &nbsp; 7.796852] ipmi_si: IPMI System Interfac=
e driver</div><div>[&nbsp; &nbsp; 7.796893] ipmi_si dmi-ipmi-si.0: ipmi_pla=
tform: probing via SMBIOS</div><div>[&nbsp; &nbsp; 7.796900] ipmi_platform:=
 ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1 irq 0</div><div>[&nbsp; &nbs=
p; 7.796905] ipmi_si: Adding SMBIOS-specified kcs state machine</div><div>[=
&nbsp; &nbsp; 7.797140] ipmi_si: Trying SMBIOS-specified kcs state machine =
at i/o address 0xca2, slave address 0x20, irq 0</div><div>[&nbsp; &nbsp; 7.=
797152] ipmi_si dmi-ipmi-si.0: Interface detection failed</div></div><div><=
br></div><div><br></div><div dir=3D"ltr" data-setdir=3D"false">BMC Logs:&nb=
sp;</div><div dir=3D"ltr" data-setdir=3D"false"><div><div>[&nbsp; &nbsp; 0.=
301014] ast-kcs-bmc 1e78902c.kcs: Initialised IPMI client for channel 3</di=
v><div>[&nbsp; &nbsp; 0.301085] ast-kcs-bmc 1e78902c.kcs: Initialised chann=
el 3 at 0xca2</div><div>[&nbsp; &nbsp;22.521031] systemd[1]: Created slice =
Slice /system/phosphor-ipmi-kcs.<br></div></div><div><br></div><div dir=3D"=
ltr" data-setdir=3D"false"><div><div>&nbsp;systemctl status phosphor-ipmi-k=
cs@ipmi-kcs3</div><div>=E2=97=8F phosphor-ipmi-kcs@ipmi-kcs3.service - Phos=
phor IPMI KCS DBus Bridge</div><div>&nbsp; &nbsp; &nbsp;Loaded: loaded (/li=
b/systemd/system/phosphor-ipmi-kcs@.service; enabled; vendor preset: disabl=
ed)</div><div>&nbsp; &nbsp; &nbsp;Active: active (running) since Thu 1970-0=
1-01 00:01:54 UTC; 24min ago</div><div>&nbsp; &nbsp;Main PID: 443 (kcsbridg=
ed)</div><div>&nbsp; &nbsp; &nbsp;CGroup: /system.slice/system-phosphor\x2d=
ipmi\x2dkcs.slice/phosphor-ipmi-kcs@ipmi-kcs3.service</div><div>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=E2=94=94=E2=94=80 443 /usr/libexec/kc=
sbridged -c ipmi-kcs3</div><div><br></div><div>Jan 01 00:01:53 Aselsan-Serv=
er systemd[1]: Starting Phosphor IPMI KCS DBus Bridge...</div><div>Jan 01 0=
0:01:54 Aselsan-Server systemd[1]: Started Phosphor IPMI KCS DBus Bridge.</=
div></div><br></div><br></div></div><div dir=3D"ltr" data-setdir=3D"false">=
<br></div></div></body></html>
------=_Part_3312598_1035994222.1665147362405--
