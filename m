Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AED5FAE08
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 10:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmpLt6ThJz3bkC
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 19:08:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=gr7oieLH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=74.6.135.123; helo=sonic310-13.consmr.mail.bf2.yahoo.com; envelope-from=erhan14@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=gr7oieLH;
	dkim-atps=neutral
Received: from sonic310-13.consmr.mail.bf2.yahoo.com (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmpLD6XT0z2yMk
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 19:07:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1665475662; bh=P3ssBkO9SorDaN1aRWs8IOG22Z4F+HeBFGtXUnVgYTU=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=gr7oieLHSlXDOhrJA4kkUeeyHfiXokkds/0eyRlpM/viTnZPe18jeTcEGZxGahAIpW6w6ELRgfcCen25JHF3lNBqmivlyZ81d0ZckBWI7rdfoAXAeQXpixdFEzVnilBShOoZ+Stsm5oT3TDKVi+cd3afnKrqK43VdAJyTJhmvlYzmj1PqL6dq1TCkOixpwm/qMB4FSWRkfA6kzKWIXoiglFKBNTwuq0kr1wQwqjK0lG2HUrojgIGfTDEn08jCXo60w5/JsRoElr2wTg2ZrxcUSKFJ1QvLM1xIv9UaDHyB/v75BUDPjU8vXxeMYzPTdUXbhjjIPQ3zUsg+vT2BVJqFw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1665475662; bh=SDX8E+9unEswgl/HGbQDUO9t2ZkJvOh26dyU2jsNCzZ=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=HYG4y53X5rKcEtBxUa17mIRAez/fxCKEFrUKDD+FFP/hyHXn5D2kStlM460QEIrOCWVYdz620LFnCiDKwX6x5aFIdyo58BtSz7x0Skqq+yL661oyf3QNmClL32sqFcdKvHqMdW01fLJkOd0NnAfNB081PffcB7yVsKQOc9YfBHQZOBMWdpijKHOhGj/zgBqBCmb44jEFIDVQk02Z2va2NB+N5jsugL12SF4SoAwhIg3+I8g0OXNJAicXkpuzAwSJQ9R7LkvWPOJR4LrRmCCfpMXGRFUGn0sVT//+0UuLp+Y32PrazXfknvYv73SPA4e9uQB2b+hluFnimvfvwrt5Xw==
X-YMail-OSG: 9qT9m1MVM1kd9jDHGtMeJ3pM1kSPdAjN4zwn4JftjE2_Fptg6GY3QT9P0IZ_5FJ
 7h5iT5Cs_4JkCT8zKwatVVTzn10UXWxH84jXCd7U7l7HJFwVVyGHBdH9FTLcACVAMAKWSoJZmgaH
 ICFm7tt.khCtv52C3yYzuRmIJB4Hdiy8MhO618Vo4XrWRGrj.lg0oVoLG4K3IyNA6x0Q3LxivNo0
 4UZpe5QHvA.6UUPWSxMFFU_7Rgw5VWnouEsmqfAQTMhlwT_xJ8FUWtbieJ7sbwn3WsyxL59btTEd
 a1OsB_sY.xf9MmYHSPy1NCOj0ZLXPaeJk3QUkiT3ArNyie5mmJRqRG7Ia5C1r0H0FF_xptQKXrq1
 jJAo09eEIy1LwkTVcxaRitSRf.55rYgRCWRIaGJyNSLI7ffe5_FyPAEj.N87ZdBYXYGKllL46A6t
 i3K.iqHPih6LX3Y9GVyZ8Uhz23PFeiInEQJle5YOVCqO.Vaa517.JjunPhTqCIxu0g7wXjNASAZA
 rKunbFMWKeLigVQMUeCB8iBOiJkjMk4102XEz5LCUp39hHZpPJJSGFqiaPONRvc9krW.eUskSIBj
 80HJK_AhVkyVhshfukE9jD6ROfOtSCRdY7P2TE.lU1CMRa7h6Mfw6UQZb.Su.hp57baEtq4iM2f2
 LWuh5.kxbUV7nGIHBNpIg27rlz7EG8xwDnB7aMwX5TcqzyKrcyxPe2RRhYwM8z_02yY5k4kdIRkW
 mmAjTO0JAK9ncQUMhOUTnix2nruXb2paUs5.WbAUvXgl70UuekYc6enU9YU72DvkNvzgkN6E0DWi
 l2N8zpii5NJOCeXFzsrN5BhjPiAp5XXbzJaNtOMKcdjVBDWZXWilAUZ9N1kbXFsj3y6L0cxnVKCc
 fNT39jyrNWxUImEdAEvLRKVJJQS2cRKL91Oer3FYSjgmQfrp_PxsgtwU4HwoXUOfCwWOeEPx.q1Y
 TIo3N6pi59YK.7UGNEfXUZ_mbCWnCPePxyBYnbJac1Nl_S_KSztekFMoGYbyjp7RPKlUKimPDXGV
 TUZ_Zf3JAUacc_XCbOStL7kRt_cCaLb8yv.HDm4I2I4Lgm3KrLHu3ZZrkJBCD2vBH8HI.ETgNLnu
 ElhNsWtFEsAtjXLyRoHlfHOcIbeDY4Nf8qh47loL21HwpWhxqnZMD_og3X24i_y5D8OCOi7.uqxH
 zYW06hfhtnX3gEkaqZLlyNr1lcrzWQUHPK2XL2TOgg4tGDCvNaY48oh0r6ob50ir24zLzNHdUSYs
 MbUPluDsHhOeGELtM7RqP2By8vCYjZrUPUEcCanGmiINvyaFFPXazOdLZIkUW7BtGh6B0d11NJi_
 zWGArCfk7YnJj8BYte0xskc4CP7PcYLlsTiiy1c80wQuqIDlAvFnVGuwMnr42AJzt.48MroIxWvM
 l3SWpT4YJAdzWjJm4SaOZ.0Ywzb0ey5xQla2PcFo.LEfp.Ki3vG8xGAAHbrNGQMuw2Or.9z05LN4
 1lmN4MHOLy.9s3ClqUmV_cdDRF56ce1vS.soCaOCCo5ywdH3XkdsdkhCE5pV3IHNgpm6IVfSp6MV
 oPc9QYdeKpqDxxr3t2s8_X8RBsL8GUzNiFu1fbXYfbzghtn7__HDytxY91mpEgWLEO3.YTS4fRz4
 Q5qN9M0NDUsn9VBeWV.p5Bk70E1oFzBO0BWhUX.N_y2y1AQOJwxrBgzMTsUVSm2d.3.suETOC1Fi
 Y0qhO7WYtkmbECbS4Kq2SXwdiEwgDHi6HXYM0clTThn.W6R6zMk4UdsoYgAc6WacFKujR33mrQWG
 SDmvQYvuEJEWOK6hOMbYiyhLw9NSBlW7mEtTp.rXpPlhAeEgVpzOXfqNgaCJdaDCafWT5IRysryT
 gZmXxpdcnGqn0spbtmSNWpwLSM7MsMdZHqDzqDUPIarysBuuDqKPhaSsJy7PvcbMfn8xZSBxwaJc
 XvBd9UoU0argzFjAZSMXpi2N7AkjZW9UMYmIx_hCHDHd7tL650V7MXKuqrGQ3z6WpVbUzrJ5H61.
 XOlvDSgyKRN9ruO0RlvotWW3jHWINLxi.d4AFVSDfOZT7lsGEOvQNlyhccVYB6hijGZoixviz.8L
 RJbRqh8V_QS6pxZBwNqVI1eRXwtEao8X0W5ZtZ0IT09ANOi5VVgWaHg2yBFF8Jjvn.UaaI7ryzD2
 VnJW.Z7d_g6vj9vwbOSFgxP3N3dipmUMgNViNItU4.gHfrdR5C4YPj_LDyYiWhoUo.tAwYoB9dfU
 y9oqI1zAoqqu38r016QNlWMfMUrMkJ0SFRBd_aJc-
X-Sonic-MF: <erhan14@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 11 Oct 2022 08:07:42 +0000
Date: Tue, 11 Oct 2022 08:07:38 +0000 (UTC)
From: "Erhan Y." <erhan14@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"fercerpav@gmail.com" <fercerpav@gmail.com>
Message-ID: <1986804193.85060.1665475658945@mail.yahoo.com>
In-Reply-To: <mailman.11.1665190801.31159.openbmc@lists.ozlabs.org>
References: <mailman.11.1665190801.31159.openbmc@lists.ozlabs.org>
Subject: Re: openbmc Digest, Vol 86, Issue 26
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_85059_526194053.1665475658942"
X-Mailer: WebService/1.1.20740 YMailNorrin
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

------=_Part_85059_526194053.1665475658942
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Hi,- We can use UEFI or user space tools to send the SMBIOS tables to BMC.=
 Isn't there any pre-ready tool for Intel based servers?- kcs3 is already d=
efined in our DTS too.=C2=A0
- Serial port redirection (vUART) is working. What else we can do to test i=
f LPC between host and BMC is working?- Inband IPMI is not working with KCS=
- We defined=C2=A0/usr/share/ipmi-providers/channel_config.json but nothing=
 has changed

HOST dmidecode
Handle 0x0013,DMI type 38, 18 bytes

IPMI DeviceInformation

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Interface Type: KCS (Keyboard Con=
trol Style)

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specification Version: 2.0

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I2C Slave Address: 0x10

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NV Storage Device: Not Present

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Base Address: 0x0000000000000CA2 =
(I/O)

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Register Spacing: Successive Byte=
 Boundaries

=C2=A0

HOST ipmi_sidriver:

[=C2=A0=C2=A0=C2=A07.803541] ipmi_si: Trying SMBIOS-specified kcs state mac=
hine at i/o address0xca2, slave address 0x20, irq 0
[=C2=A0=C2=A0=C2=A07.803550] ipmi_si dmi-ipmi-si.0: Interface detection fai=
led

BMC LOG:root@Test-Server:~# journalctl -xe | grep ipmi=E2=96=91=E2=96=91 Su=
bject: A start job for unit phosphor-ipmi-host.service has begun execution=
=E2=96=91=E2=96=91 A start job for unit phosphor-ipmi-host.service has begu=
n execution.Jan 01 00:01:36 Test-Server ipmid[402]: JSON file not foundJan =
01 00:01:49 Test-Server ipmid[402]: System event sensor not foundJan 01 00:=
01:49 Test-Server ipmid[402]: The operation failed internally.Jan 01 00:01:=
49 Test-Server ipmid[402]: Failed to convert /xyz/openbmc_project/logging/e=
ntry/1 to SEL: xyz.openbmc_project.Common.Error.InternalFailure: The operat=
ion failed internally.Jan 01 00:01:49 Test-Server ipmid[402]: System event =
sensor not foundJan 01 00:01:49 Test-Server ipmid[402]: The operation faile=
d internally.Jan 01 00:01:50 Test-Server ipmid[402]: Registering OEM:[0X00C=
2CF], Cmd:[0X04] for Manual Zone Control=E2=96=91=E2=96=91 Subject: A start=
 job for unit phosphor-ipmi-host.service has finished successfully=E2=96=91=
=E2=96=91 A start job for unit phosphor-ipmi-host.service has finished succ=
essfully.=E2=96=91=E2=96=91 Subject: A start job for unit phosphor-ipmi-kcs=
@ipmi-kcs3.service has begun execution=E2=96=91=E2=96=91 A start job for un=
it phosphor-ipmi-kcs@ipmi-kcs3.service has begun execution.=E2=96=91=E2=96=
=91 Subject: A start job for unit phosphor-ipmi-net@eth0.service has finish=
ed successfully=E2=96=91=E2=96=91 A start job for unit phosphor-ipmi-net@et=
h0.service has finished successfully.Jan 01 00:01:51 Test-Server ipmid[402]=
: Loading whitelist filter=E2=96=91=E2=96=91 Subject: A start job for unit =
phosphor-ipmi-kcs@ipmi-kcs3.service has finished successfully=E2=96=91=E2=
=96=91 A start job for unit phosphor-ipmi-kcs@ipmi-kcs3.service has finishe=
d successfully.Jan 01 00:01:52 Test-Server ipmid[402]: New interface mappin=
gJan 01 00:01:52 Test-Server ipmid[402]: Set restrictedMode =3D falseJan 01=
 00:01:53 Test-Server ipmid[402]: Error when call setAttention methodJan 01=
 00:01:54 Test-Server netipmid[437]: Failed to get bus nameJan 01 00:01:54 =
Test-Server netipmid[437]: Bind to interfaeJan 01 00:01:54 Test-Server ipmi=
d[402]: New interface mappingJan 01 00:01:56 Test-Server ipmid[402]: Host c=
ontrol timeout hit!Jan 01 00:01:57 Test-Server ipmid[402]: Error when call =
setAttention methodJan 01 00:02:00 Test-Server ipmid[402]: Host control tim=
eout hit!


    On Saturday, October 8, 2022 at 04:00:36 AM GMT+3, openbmc-request@list=
s.ozlabs.org <openbmc-request@lists.ozlabs.org> wrote:=20
=20
 >Hi,

On Fri, Oct 07, 2022 at 12:56:02PM +0000, Erhan Y. wrote:
>> We are trying to get SMBIOS tables from host on BMC (ast-2500).

> What tools are you going to use for that once you get IPMI exchange
> working? On our Tioga Pass system it's performed by UEFI on startup
> using MDRv1 protocol.

>> KCS#3 is enabled in DTS (with address CA2)

&kcs3 {=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // BMC KCS channel 3
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D "okay";
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed,lpc-io-reg =3D <0xca2>;
};

is what works for us.

>> [? ? 7.796852] ipmi_si: IPMI System Interface driver
>> [? ? 7.796893] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via SMBIOS
>> [? ? 7.796900] ipmi_platform: ipmi_si: SMBIOS: io 0xca2 regsize 1 spacin=
g 1 irq 0
>> [? ? 7.796905] ipmi_si: Adding SMBIOS-specified kcs state machine
>> [? ? 7.797140] ipmi_si: Trying SMBIOS-specified kcs state machine at i/o=
 address 0xca2, slave address 0x20, irq 0

This looks correct.

>> BMC Logs:?
>> [? ? 0.301014] ast-kcs-bmc 1e78902c.kcs: Initialised IPMI client for cha=
nnel 3
>> [? ? 0.301085] ast-kcs-bmc 1e78902c.kcs: Initialised channel 3 at 0xca2

This too, 1e78902c.kcs is created and used.

So everything looks proper so far.

Do you know if LPC communication between your host and BMC works at
all? Apart from KCS it's also often used for 16550A serial ports (with
BMC being an LPC slave).

Do you have appropriate confguration for ipmi_kcs3 in
/usr/share/ipmi-providers/channel_config.json?

--=20
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com


 =20
------=_Part_85059_526194053.1665475658942
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp4514369byahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div id=3D"ydp4514369byiv8929625084"><div style=3D"font-family:Helvetica=
 Neue, Helvetica, Arial, sans-serif;font-size:16px;" class=3D"ydp4514369byi=
v8929625084ydp4268bbbdyahoo-style-wrap"><div></div>
        <div dir=3D"ltr">Hi,</div><div dir=3D"ltr"><span><span style=3D"col=
or:rgb(38, 40, 42);font-family:Helvetica Neue, Helvetica, Arial, sans-serif=
;">- We can use UEFI or user space tools to send the SMBIOS tables to BMC. =
Isn't there any pre-ready tool for Intel based servers?</span></span></div>=
<div dir=3D"ltr"><span><span style=3D"color:rgb(38, 40, 42);font-family:Hel=
vetica Neue, Helvetica, Arial, sans-serif;">- kcs3 is already defined in ou=
r DTS too.&nbsp;</span></span><br clear=3D"none"></div><div dir=3D"ltr"><sp=
an><span style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helveti=
ca, Arial, sans-serif;">- Serial port redirection (vUART) is working. What =
else we can do to test if LPC between host and BMC is working?</span></span=
></div><div dir=3D"ltr" data-setdir=3D"false"><span><span style=3D"color:rg=
b(38, 40, 42);font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">- =
Inband IPMI is not working with KCS</span></span></div><div dir=3D"ltr" dat=
a-setdir=3D"false"><span><span style=3D"color:rgb(38, 40, 42);font-family:H=
elvetica Neue, Helvetica, Arial, sans-serif;">- We defined&nbsp;<span><span=
 style=3D"color: rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, Aria=
l, sans-serif; font-size: 16px;">/usr/share/ipmi-providers/channel_config.j=
son but nothing has changed</span></span></span></span></div><div dir=3D"lt=
r" data-setdir=3D"false"><span><span style=3D"color:rgb(38, 40, 42);font-fa=
mily:Helvetica Neue, Helvetica, Arial, sans-serif;"><span><span style=3D"co=
lor: rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, Arial, sans-seri=
f; font-size: 16px;"><br></span></span></span></span></div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><sp=
an><span style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helveti=
ca, Arial, sans-serif;"><span><div><u><span style=3D"font-size:12.0pt;color=
:#993300">HOST dmidecode</span></u></div>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">Handle 0x0013,
DMI type 38, 18 bytes</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">IPMI Device
Information</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Interface Type: KCS (Keyboard Control Style)</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Specification Version: 2.0</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
I2C Slave Address<b>: 0x10</b></span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
NV Storage Device: Not Present</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Base Address: 0x0000000000000CA2 (I/O)</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Register Spacing: Successive Byte Boundaries</span></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">&nbsp;</span></p>

<p class=3D"ydpe629033eMsoNormal"><u><span style=3D"font-size:12.0pt;color:=
#993300">HOST ipmi_si
driver:</span></u></p>

<p class=3D"ydpe629033eMsoNormal"><span style=3D"font-size:12.0pt;color:#99=
3300">[&nbsp;&nbsp;&nbsp;
7.803541] ipmi_si: Trying SMBIOS-specified kcs state machine at i/o address
0xca2, <b>slave address 0x20</b>, irq 0</span></p>

<div><span style=3D"font-size:12.0pt;color:#993300">[&nbsp;&nbsp;&nbsp;
7.803550] ipmi_si dmi-ipmi-si.0: Interface detection failed</span></div><di=
v><span style=3D"font-size:12.0pt;color:#993300"><br></span></div><div dir=
=3D"ltr" data-setdir=3D"false"><span style=3D"font-size:12.0pt;color:#99330=
0"><br></span></div><div dir=3D"ltr" data-setdir=3D"false"><span style=3D"f=
ont-size:12.0pt;color:#993300">BMC LOG:</span></div><div dir=3D"ltr" data-s=
etdir=3D"false"><div><div>root@Test-Server:~# journalctl -xe | grep ipmi</d=
iv><div>=E2=96=91=E2=96=91 Subject: A start job for unit phosphor-ipmi-host=
.service has begun execution</div><div>=E2=96=91=E2=96=91 A start job for u=
nit phosphor-ipmi-host.service has begun execution.</div><div>Jan 01 00:01:=
36 Test-Server ipmid[402]: JSON file not found</div><div>Jan 01 00:01:49 Te=
st-Server ipmid[402]: System event sensor not found</div><div>Jan 01 00:01:=
49 Test-Server ipmid[402]: The operation failed internally.</div><div>Jan 0=
1 00:01:49 Test-Server ipmid[402]: Failed to convert /xyz/openbmc_project/l=
ogging/entry/1 to SEL: xyz.openbmc_project.Common.Error.InternalFailure: Th=
e operation failed internally.</div><div>Jan 01 00:01:49 Test-Server ipmid[=
402]: System event sensor not found</div><div>Jan 01 00:01:49 Test-Server i=
pmid[402]: The operation failed internally.</div><div>Jan 01 00:01:50 Test-=
Server ipmid[402]: Registering OEM:[0X00C2CF], Cmd:[0X04] for Manual Zone C=
ontrol</div><div>=E2=96=91=E2=96=91 Subject: A start job for unit phosphor-=
ipmi-host.service has finished successfully</div><div>=E2=96=91=E2=96=91 A =
start job for unit phosphor-ipmi-host.service has finished successfully.</d=
iv><div>=E2=96=91=E2=96=91 Subject: A start job for unit phosphor-ipmi-kcs@=
ipmi-kcs3.service has begun execution</div><div>=E2=96=91=E2=96=91 A start =
job for unit phosphor-ipmi-kcs@ipmi-kcs3.service has begun execution.</div>=
<div>=E2=96=91=E2=96=91 Subject: A start job for unit phosphor-ipmi-net@eth=
0.service has finished successfully</div><div>=E2=96=91=E2=96=91 A start jo=
b for unit phosphor-ipmi-net@eth0.service has finished successfully.</div><=
div>Jan 01 00:01:51 Test-Server ipmid[402]: Loading whitelist filter</div><=
div>=E2=96=91=E2=96=91 Subject: A start job for unit phosphor-ipmi-kcs@ipmi=
-kcs3.service has finished successfully</div><div>=E2=96=91=E2=96=91 A star=
t job for unit phosphor-ipmi-kcs@ipmi-kcs3.service has finished successfull=
y.</div><div>Jan 01 00:01:52 Test-Server ipmid[402]: New interface mapping<=
/div><div>Jan 01 00:01:52 Test-Server ipmid[402]: Set restrictedMode =3D fa=
lse</div><div>Jan 01 00:01:53 Test-Server ipmid[402]: Error when call setAt=
tention method</div><div>Jan 01 00:01:54 Test-Server netipmid[437]: Failed =
to get bus name</div><div>Jan 01 00:01:54 Test-Server netipmid[437]: Bind t=
o interfae</div><div>Jan 01 00:01:54 Test-Server ipmid[402]: New interface =
mapping</div><div>Jan 01 00:01:56 Test-Server ipmid[402]: Host control time=
out hit!</div><div>Jan 01 00:01:57 Test-Server ipmid[402]: Error when call =
setAttention method</div><div>Jan 01 00:02:00 Test-Server ipmid[402]: Host =
control timeout hit!</div><div><br></div></div></div></span></span></span><=
/div><div dir=3D"ltr"><span><span style=3D"color:rgb(38, 40, 42);font-famil=
y:Helvetica Neue, Helvetica, Arial, sans-serif;"><br clear=3D"none"></span>=
</span></div><div><br clear=3D"none"></div>
       =20
        </div><div id=3D"ydp4514369byiv8929625084ydp59aeb5adyahoo_quoted_56=
02659905" class=3D"ydp4514369byiv8929625084ydp59aeb5adyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Saturday, October 8, 2022 at 04:00:36 AM GMT+3, open=
bmc-request@lists.ozlabs.org &lt;openbmc-request@lists.ozlabs.org&gt; wrote=
:
                <br></div>
                </div></div></div></div><div id=3D"ydp33f67da9yiv8929625084=
yqtfd53609" class=3D"ydp33f67da9yiv8929625084yqt8555863371"><div><br clear=
=3D"none"></div>
                <div>&gt;Hi,<br clear=3D"none"></div><div><div dir=3D"ltr">=
<br clear=3D"none"></div><div dir=3D"ltr">On Fri, Oct 07, 2022 at 12:56:02P=
M +0000, Erhan Y. wrote:<br clear=3D"none"></div><div dir=3D"ltr">&gt;&gt; =
We are trying to get SMBIOS tables from host on BMC (ast-2500).<br clear=3D=
"none"></div><div dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">&gt=
; What tools are you going to use for that once you get IPMI exchange<br cl=
ear=3D"none"></div><div dir=3D"ltr">&gt; working? On our Tioga Pass system =
it's performed by UEFI on startup<br clear=3D"none"></div><div dir=3D"ltr">=
&gt; using MDRv1 protocol.<br clear=3D"none"></div><div dir=3D"ltr"><br cle=
ar=3D"none"></div><div dir=3D"ltr">&gt;&gt; KCS#3 is enabled in DTS (with a=
ddress CA2)<br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></d=
iv><div dir=3D"ltr">&amp;kcs3 { <br clear=3D"none"></div><div dir=3D"ltr">&=
nbsp; &nbsp; &nbsp; &nbsp; // BMC KCS channel 3<br clear=3D"none"></div><di=
v dir=3D"ltr">&nbsp; &nbsp; &nbsp; &nbsp; status =3D "okay";<br clear=3D"no=
ne"></div><div dir=3D"ltr">&nbsp; &nbsp; &nbsp; &nbsp; aspeed,lpc-io-reg =
=3D &lt;0xca2&gt;;<br clear=3D"none"></div><div dir=3D"ltr">};<br clear=3D"=
none"></div><div dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">is w=
hat works for us.<br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"non=
e"></div><div dir=3D"ltr">&gt;&gt; [? ? 7.796852] ipmi_si: IPMI System Inte=
rface driver<br clear=3D"none"></div><div dir=3D"ltr">&gt;&gt; [? ? 7.79689=
3] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via SMBIOS<br clear=3D"non=
e"></div><div dir=3D"ltr">&gt;&gt; [? ? 7.796900] ipmi_platform: ipmi_si: S=
MBIOS: io 0xca2 regsize 1 spacing 1 irq 0<br clear=3D"none"></div><div dir=
=3D"ltr">&gt;&gt; [? ? 7.796905] ipmi_si: Adding SMBIOS-specified kcs state=
 machine<br clear=3D"none"></div><div dir=3D"ltr">&gt;&gt; [? ? 7.797140] i=
pmi_si: Trying SMBIOS-specified kcs state machine at i/o address 0xca2, sla=
ve address 0x20, irq 0<br clear=3D"none"></div><div dir=3D"ltr"><br clear=
=3D"none"></div><div dir=3D"ltr">This looks correct.<br clear=3D"none"></di=
v><div dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">&gt;&gt; BMC L=
ogs:?<br clear=3D"none"></div><div dir=3D"ltr">&gt;&gt; [? ? 0.301014] ast-=
kcs-bmc 1e78902c.kcs: Initialised IPMI client for channel 3<br clear=3D"non=
e"></div><div dir=3D"ltr">&gt;&gt; [? ? 0.301085] ast-kcs-bmc 1e78902c.kcs:=
 Initialised channel 3 at 0xca2<br clear=3D"none"></div><div dir=3D"ltr"><b=
r clear=3D"none"></div><div dir=3D"ltr">This too, 1e78902c.kcs is created a=
nd used.<br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div>=
<div dir=3D"ltr">So everything looks proper so far.<br clear=3D"none"></div=
><div dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">Do you know if =
LPC communication between your host and BMC works at<br clear=3D"none"></di=
v><div dir=3D"ltr">all? Apart from KCS it's also often used for 16550A seri=
al ports (with<br clear=3D"none"></div><div dir=3D"ltr">BMC being an LPC sl=
ave).<br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div><di=
v dir=3D"ltr">Do you have appropriate confguration for ipmi_kcs3 in<br clea=
r=3D"none"></div><div dir=3D"ltr">/usr/share/ipmi-providers/channel_config.=
json?<br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div><di=
v dir=3D"ltr">-- <br clear=3D"none"></div><div dir=3D"ltr">Be free, use fre=
e (<a shape=3D"rect" href=3D"http://www.gnu.org/philosophy/free-sw.html" re=
l=3D"nofollow" target=3D"_blank">http://www.gnu.org/philosophy/free-sw.html=
</a>) software!<br clear=3D"none"></div><div dir=3D"ltr">mailto:<a shape=3D=
"rect" href=3D"mailto:fercerpav@gmail.com" rel=3D"nofollow" target=3D"_blan=
k">fercerpav@gmail.com</a><br clear=3D"none"></div><div dir=3D"ltr"><br cle=
ar=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div></div>
            </div><div id=3D"ydp33f67da9yiv8929625084yqtfd53597" class=3D"y=
dp33f67da9yiv8929625084yqt8555863371">
        </div></body></html>
------=_Part_85059_526194053.1665475658942--
