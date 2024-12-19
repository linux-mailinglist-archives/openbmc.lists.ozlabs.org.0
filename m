Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2F9F87B1
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 23:16:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDlJC4hTxz3cG5
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2024 09:16:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.51.26.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734594858;
	cv=none; b=A6AaxIWsTF19o/t6CpwdBO9oPaTDlYj0/k3l+4booGS6vM4yMqYnwgeKZjS8g6DIqSKkLGZv3a4Aa3AlsmT1ky8ZCeQbDh1xYiFptmB6k2uGs2w52PGmMX5KbnPp3PUbMEo2OVDwY8bjAyX5yvK6sXJ0R0WcQA+ZbktH7DYUyr87Gy4XsWJu911YbVan4RVwSHiVtwq1q2ogAUGKU2694hC+7ESSX+7tB5GulDetm14j2XNqCLBLOwrLmQ+96+4hQ1r0wNOh0icJu5MpIcN5I1AbclnOWzLz0pgpf0ctkWs6gsOsW+bkuuj8y7xs2N1FFyj7IRQnFxTOKW3ja/UcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734594858; c=relaxed/relaxed;
	bh=ExM72Bp5urBLOkLgIJ550qIPa3VWBRkyXHYM6ydlE0g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DNQppoNYzVkApOPTjPDcvuP6Rp+yxkzbcF5LW+VsDil1fJVWxjbrMOYNJO58kH7VxVZtjidl706OxeIlQaG2mZF1f5cDMW2DpkdKVhG3aBo1WfsXBl+/R4N1GWFapb8PP7RKI7kwwgvSvT/TljlOe/wcUwoTMBD9ItEhPheOkKwi9C6s2IuWpjsoir5oUzthaeSWMQUHHZGhEv0BNBcKoklF/UdccaHkeQLqFGj6l2yijYOg3XSBwsZfCK16dIRyY+11chFoadDJ6UlaNwfo/YdtYTsfJf4K11Wrcq3mpA3Cv47voIVUEAMVCvwjoq9oTMK4NRhqsOun5KWTi6x8cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ieisystem.com; spf=pass (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=fanyi@ieisystem.com; receiver=lists.ozlabs.org) smtp.mailfrom=ieisystem.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ieisystem.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ieisystem.com (client-ip=210.51.26.145; helo=unicom145.biz-email.net; envelope-from=fanyi@ieisystem.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Thu, 19 Dec 2024 18:54:15 AEDT
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDN9M0yrVz2yJL
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 18:54:14 +1100 (AEDT)
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP id PJT00157
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 15:52:57 +0800
Received: from LCXXEX09.ad.ieisystem.com (10.125.2.9) by
 LCXXEX07.ad.ieisystem.com (10.125.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Dec 2024 15:52:56 +0800
Received: from LCXXEX09.ad.ieisystem.com ([fe80::264a:3c55:1871:7af4]) by
 LCXXEX09.ad.ieisystem.com ([fe80::264a:3c55:1871:7af4%12]) with mapi id
 15.02.1544.011; Thu, 19 Dec 2024 15:52:56 +0800
From: =?gb2312?B?VmFudGxlciBGYW4gKLe20uYp?= <fanyi@ieisystem.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Consultation on the invalidation of OpenBMC IMA/EVM function
Thread-Topic: Consultation on the invalidation of OpenBMC IMA/EVM function
Thread-Index: AdtR5y2afTZXqoo4QPqygPb5il0wSw==
Date: Thu, 19 Dec 2024 07:52:55 +0000
Message-ID: <056238eba5b645c180b31dfbac427c41@ieisystem.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.129.41.22]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_002F_01DB522D.F1F65420"
MIME-Version: 1.0
tUid: 20241219155257085ae8b1df9a20edf70f6b36bd10102a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Status: No, score=-0.7 required=5.0 tests=HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 20 Dec 2024 09:16:24 +1100
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

------=_NextPart_000_002F_01DB522D.F1F65420
Content-Type: multipart/mixed;
	boundary="----=_NextPart_001_0030_01DB522D.F1F65420"


------=_NextPart_001_0030_01DB522D.F1F65420
Content-Type: multipart/alternative;
	boundary="----=_NextPart_002_0031_01DB522D.F1F65420"


------=_NextPart_002_0031_01DB522D.F1F65420
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

Dear OpenBMC developer(s):

       I have a problem with IMA/EVM func of OpenBMC. I enabled IMA
function, but it doesn't seem to work.

       I change the policy in IMA (appraise func=3DMMAP_CHECK =
mask=3DMAY_EXEC
appraise_type=3Dimasig  &&  appraise func=3DBPRM_CHECK mask=3DMAY_EXEC
appraise_type=3Dimasig), and upload a program (by SSH, without sig), It =
can
run without any blocking. The expectation is that it should be rejected.

       I check /sys/kernel/security/ima/ascii_runtime_measurements, it =
has
the value like =A1=B010 XXXXXXXXXXXX ima-sig sha256:YYYYYYYYYYYYYYY
/root/home/root/program=A1=B1.=20

After that I use =A1=B0echo TEST >> program=A1=B1 to change the program =
file, and it
can run as usual, and a new item like =A1=B010 AAAAAAAAAA ima-sig
sha256:BBBBBBBBBBBBBB =
/root/run/media/rwfs-alt/cow/home/root/program=A1=B1shows
in /sys/kernel/security/ima/ascii_runtime_measurements. Every time I =
change
the file and run it, a new item will add to ascii_runtime_measurements. =
I
don=A1=AFt know why and how to fix it.

(XXXX/YYYY/AAAA/BBBB represent hash values or other hexadecimal strings)

=20

       Env: Qemu with AST2600

       Local.conf of project (what I modified):

               DISTRO_FEATURES:append =3D " integrity ima"

=20

         IMAGE_CLASSES +=3D "ima-evm-rootfs"

=20

         IMA_EVM_KEY_DIR =3D "${INTEGRITY_BASE}/data/debug-keys"   =
(replaced
by my keys)

         IMA_EVM_PRIVKEY =3D "${IMA_EVM_KEY_DIR}/privkey_ima.pem"

         IMA_EVM_X509 =3D "${IMA_EVM_KEY_DIR}/x509_ima.der"

         IMA_EVM_ROOT_CA =3D "${IMA_EVM_KEY_DIR}/ima-local-ca.pem"

=20

       Boot log: Log file in email attachment

       System Env:

root@NULL:~# cat /sys/kernel/security/ima/policy

dont_measure fsmagic=3D0x9fa0

dont_measure fsmagic=3D0x62656572

dont_measure fsmagic=3D0x64626720

dont_measure fsmagic=3D0x1021994

dont_measure fsmagic=3D0x1cd1

dont_measure fsmagic=3D0x42494e4d

dont_measure fsmagic=3D0x73636673

dont_measure fsmagic=3D0xf97cff8c

dont_measure fsmagic=3D0x43415d53

dont_measure fsmagic=3D0x27e0eb

dont_measure fsmagic=3D0x63677270

dont_measure fsmagic=3D0x6e736673

dont_measure fsmagic=3D0xde5e81e4

measure func=3DMMAP_CHECK mask=3DMAY_EXEC

measure func=3DBPRM_CHECK mask=3DMAY_EXEC

measure func=3DFILE_CHECK mask=3D^MAY_READ euid=3D0

measure func=3DFILE_CHECK mask=3D^MAY_READ uid=3D0

measure func=3DMODULE_CHECK

measure func=3DFIRMWARE_CHECK

measure func=3DPOLICY_CHECK

dont_appraise fsmagic=3D0x9fa0

dont_appraise fsmagic=3D0x62656572

dont_appraise fsmagic=3D0x64626720

dont_appraise fsmagic=3D0x1021994

dont_appraise fsmagic=3D0x858458f6

dont_appraise fsmagic=3D0x1cd1

dont_appraise fsmagic=3D0x42494e4d

dont_appraise fsmagic=3D0x73636673

dont_appraise fsmagic=3D0xf97cff8c

dont_appraise fsmagic=3D0x43415d53

dont_appraise fsmagic=3D0x6e736673

dont_appraise fsmagic=3D0xde5e81e4

dont_appraise fsmagic=3D0x27e0eb

dont_appraise fsmagic=3D0x63677270

appraise func=3DPOLICY_CHECK appraise_type=3Dimasig

appraise func=3DMMAP_CHECK mask=3DMAY_EXEC appraise_type=3Dimasig

appraise func=3DBPRM_CHECK mask=3DMAY_EXEC appraise_type=3Dimasig        =
       (I
rewirte the default appraise policy in ima_policy.c in kernel, so I can
appraise progs with sig by default)

=20

root@NULL:~# fw_printenv

baudrate=3D115200

bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw ima_policy=3Dtcb
ima_policy=3Dappraise_tcb

bootcmd=3Drun bootspi

bootdelay=3D2

bootfile=3Dall.bin

bootspi=3Dfdt addr 20100000 && fdt header get fitsize totalsize && cp.b
20100000 ${loadaddr} ${fitsize} && bootm; echo Error loading kernel FIT
image

currentpartition=3D0

fdtcontroladdr=3Dbcf8a6e8

gatewayip=3D192.168.0.1

ipaddr=3D192.168.0.45

loadaddr=3D0x83000000

netmask=3D255.255.255.0

rollback-reason=3Dno_rollback

serverip=3D192.168.0.81

stderr=3Dserial@1e784000

stdin=3Dserial@1e784000

stdout=3Dserial@1e784000

verify=3Dyes                  =20

nextpartition=3D0

=20

Thank you very much for your help

=20


------=_NextPart_002_0031_01DB522D.F1F65420
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=CE=A2=C8=ED=D1=C5=BA=DA;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@=CE=A2=C8=ED=D1=C5=BA=DA";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:=CB=CE=CC=E5;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML =D4=A4=C9=E8=B8=F1=CA=BD Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-serif;
	color:windowtext;}
span.HTMLChar
	{mso-style-name:"HTML =D4=A4=C9=E8=B8=F1=CA=BD Char";
	mso-style-priority:99;
	mso-style-link:"HTML =D4=A4=C9=E8=B8=F1=CA=BD";
	font-family:=CB=CE=CC=E5;}
span.hljs-attr
	{mso-style-name:hljs-attr;}
span.hljs-string
	{mso-style-name:hljs-string;}
span.hljs-subst
	{mso-style-name:hljs-subst;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'text-justify-trim:punctuation'><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>Dear OpenBMC developer(s):<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a problem =
with IMA/EVM func of OpenBMC. I enabled IMA function, but it doesn't =
seem to work.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I change the =
policy in IMA (appraise func=3DMMAP_CHECK mask=3DMAY_EXEC =
appraise_type=3Dimasig&nbsp; &amp;&amp; &nbsp;appraise func=3DBPRM_CHECK =
mask=3DMAY_EXEC appraise_type=3Dimasig), and upload a program (by SSH, =
without sig), It can run without any blocking. The expectation is that =
it should be rejected.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I check =
/sys/kernel/security/ima/ascii_runtime_measurements, it has the value =
like =A1=B010 XXXXXXXXXXXX ima-sig sha256:YYYYYYYYYYYYYYY =
/root/home/root/program=A1=B1. <o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'text-indent:21.0pt'><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>After that I use =A1=B0echo TEST &gt;&gt; program=A1=B1 =
to change the program file, and it can run as usual, and a new item like =
=A1=B010 AAAAAAAAAA ima-sig sha256:BBBBBBBBBBBBBB =
/root/run/media/rwfs-alt/cow/home/root/program=A1=B1shows in =
/sys/kernel/security/ima/ascii_runtime_measurements. Every time I change =
the file and run it, a new item will add to ascii_runtime_measurements. =
I don=A1=AFt know why and how to fix it.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>(XXXX/YYYY/AAAA/BBBB represent hash values or other =
hexadecimal strings)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Env: Qemu with =
AST2600<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Local.conf of =
project (what I modified):<o:p></o:p></span></p><pre =
style=3D'background:#F7F7F7'><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'>DISTRO_FEATURES:append =3D </span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>&quot; integrity ima&quot;</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p></o:p></span></pre><p =
class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;background:#F7F7F7'><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;background:#F7F7F7'><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext =
1.0pt;padding:0cm'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
IMAGE_CLASSES +=3D </span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>&quot;ima-evm-rootfs&quot;</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p></o:p></span></p><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left;background:#F7F7F7'><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;background:#F7F7F7'><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext =
1.0pt;padding:0cm'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
IMA_EVM_KEY_DIR =3D </span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>&quot;</span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#333333;border:none =
windowtext 1.0pt;padding:0cm'>${INTEGRITY_BASE}</span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>/data/debug-keys&quot;&nbsp;&nbsp; =
(replaced by my keys)</span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p></o:p></span></p><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left;background:#F7F7F7'><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext =
1.0pt;padding:0cm'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
IMA_EVM_PRIVKEY =3D </span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>&quot;</span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#333333;border:none =
windowtext 1.0pt;padding:0cm'>${IMA_EVM_KEY_DIR}</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>/privkey_ima.pem&quot;</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p></o:p></span></p><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left;background:#F7F7F7'><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext =
1.0pt;padding:0cm'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
IMA_EVM_X509 =3D </span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>&quot;</span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#333333;border:none =
windowtext 1.0pt;padding:0cm'>${IMA_EVM_KEY_DIR}</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>/x509_ima.der&quot;</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext 1.0pt;padding:0cm'><o:p></o:p></span></p><p class=3DMsoNormal =
align=3Dleft style=3D'text-align:left;background:#F7F7F7'><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737;border:none =
windowtext =
1.0pt;padding:0cm'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
IMA_EVM_ROOT_CA =3D </span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>&quot;</span><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#333333;border:none =
windowtext 1.0pt;padding:0cm'>${IMA_EVM_KEY_DIR}</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#DD1144;border:none =
windowtext 1.0pt;padding:0cm'>/ima-local-ca.pem&quot;</span><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Consolas;color:#373737'><o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Boot log: Log file =
in email attachment<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"=CE=A2=C8=ED=D1=C5=BA=DA",sans-seri=
f;color:#3E3A3A'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System =
Env:<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span lang=3DEN-US =
style=3D'color:#2E75B6;mso-style-textfill-fill-color:#2E75B6;mso-style-te=
xtfill-fill-alpha:100.0%'>root@NULL:~# cat =
/sys/kernel/security/ima/policy<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x9fa0<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x62656572<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x64626720<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x1021994<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x1cd1<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x42494e4d<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x73636673<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0xf97cff8c<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x43415d53<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x27e0eb<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x63677270<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0x6e736673<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_measure fsmagic=3D0xde5e81e4<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>measure func=3DMMAP_CHECK =
mask=3DMAY_EXEC<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span lang=3DEN-US>measure =
func=3DBPRM_CHECK mask=3DMAY_EXEC<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>measure func=3DFILE_CHECK mask=3D^MAY_READ =
euid=3D0<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span lang=3DEN-US>measure =
func=3DFILE_CHECK mask=3D^MAY_READ uid=3D0<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>measure func=3DMODULE_CHECK<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>measure func=3DFIRMWARE_CHECK<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>measure func=3DPOLICY_CHECK<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x9fa0<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x62656572<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x64626720<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x1021994<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x858458f6<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x1cd1<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x42494e4d<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x73636673<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0xf97cff8c<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x43415d53<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x6e736673<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0xde5e81e4<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x27e0eb<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>dont_appraise fsmagic=3D0x63677270<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>appraise func=3DPOLICY_CHECK =
appraise_type=3Dimasig<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span lang=3DEN-US>appraise =
func=3DMMAP_CHECK mask=3DMAY_EXEC =
appraise_type=3Dimasig<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span lang=3DEN-US>appraise =
func=3DBPRM_CHECK mask=3DMAY_EXEC =
appraise_type=3Dimasig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (I rewirte the default appraise policy =
in ima_policy.c in kernel, so I can appraise progs with sig by =
default)<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span lang=3DEN-US =
style=3D'color:#2E75B6;mso-style-textfill-fill-color:#2E75B6;mso-style-te=
xtfill-fill-alpha:100.0%'>root@NULL:~# =
fw_printenv<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span =
lang=3DEN-US>baudrate=3D115200<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span =
lang=3DEN-US>bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw =
ima_policy=3Dtcb ima_policy=3Dappraise_tcb<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>bootcmd=3Drun bootspi<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>bootdelay=3D2<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span =
lang=3DEN-US>bootfile=3Dall.bin<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>bootspi=3Dfdt addr 20100000 &amp;&amp; fdt header get =
fitsize totalsize &amp;&amp; cp.b 20100000 ${loadaddr} ${fitsize} =
&amp;&amp; bootm; echo Error loading kernel FIT =
image<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span =
lang=3DEN-US>currentpartition=3D0<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>fdtcontroladdr=3Dbcf8a6e8<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>gatewayip=3D192.168.0.1<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>ipaddr=3D192.168.0.45<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>loadaddr=3D0x83000000<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>netmask=3D255.255.255.0<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>rollback-reason=3Dno_rollback<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>serverip=3D192.168.0.81<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>stderr=3Dserial@1e784000<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>stdin=3Dserial@1e784000<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>stdout=3Dserial@1e784000<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:#F2F2F2'><span =
lang=3DEN-US>verify=3Dyes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:#F2F2F2'><span =
lang=3DEN-US>nextpartition=3D0<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal style=3D'text-indent:21.0pt'><span lang=3DEN-US>Thank =
you very much for your help<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_002_0031_01DB522D.F1F65420--

------=_NextPart_001_0030_01DB522D.F1F65420
Content-Type: application/octet-stream;
	name="Ima.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Ima.log"

U-Boot SPL 2019.04 (Sep 13 2024 - 02:31:00 +0000)
Trying to boot from RAM
## Checking hash(es) for Image uboot ... =
sha512,rsa4096:rsa_oem_fitimage_key+ OK
## Checking hash(es) for Image fdt ... =
sha512,rsa4096:rsa_oem_fitimage_key+ OK


U-Boot 2019.04 (Sep 13 2024 - 02:31:00 +0000)

SOC: AST2600-A3
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RMII/NCSI, MAC1: RMII/NCSI, MAC2: RMII/NCSI, MAC3: RMII/NCSI
Model: Otrd server board with AST2600 as the BMC
DRAM:  already initialized, 1008 MiB (capacity:1024 MiB, VGA:64 MiB, =
ECC:off)
MMC:
sdhci_slot0@100: 1, emmc_slot0@100: 0
Loading Environment from SPI Flash... SF: Detected n25q512ax3 with page =
size 256 Bytes, erase size 4 KiB, total 64 MiB
OK
In:    serial@1e784000
Out:   serial@1e784000
Err:   serial@1e784000
Model: Otrd server board with AST2600 as the BMC
Boot from Primary.
Saving Environment to SPI Flash... SF: Detected n25q512ax3 with page =
size 256 Bytes, erase size 4 KiB, total 64 MiB
Erasing SPI flash...Writing to SPI flash...done
OK
Net:
 eth2,EEPROM MAC=3D00:00:00:00:00:00

Warning: ftgmac@1e670000 (eth2) using random MAC address - =
06:ec:b7:d4:82:3b
eth2: ftgmac@1e670000ftgmac100_probe - NCSI detected
failed to get eeprom i2c device for set sharenic type!
otrd_ncsi_init failed: 0xffffff87, please check the board and dts file

 eth3,EEPROM MAC=3D00:00:00:00:00:00

Warning: ftgmac@1e690000 (eth3) using random MAC address - =
06:03:86:e2:d3:d1
, eth3: ftgmac@1e690000
Hit any key to stop autoboot:  0
## Loading kernel from FIT Image at 83000000 ...
   Using 'conf-aspeed-bmc-otrd.dtb' configuration
   Verifying Hash Integrity ... sha512,rsa4096:rsa_fitimage_key+ OK
   Trying 'kernel-1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x8300011c
     Data Size:    4548136 Bytes =3D 4.3 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80001000
     Entry Point:  0x80001000
     Hash algo:    sha512
     Hash value:   =
98c3489adb3e1aefba17a7b4a787e725194791df8e19796300740ae30b5d87bc9d5ece29b=
6a7bb5912e164e81fcba38ff064bb350f7cccb0485595590c98a0f0
   Verifying Hash Integrity ... sha512+ OK
## Loading ramdisk from FIT Image at 83000000 ...
   Using 'conf-aspeed-bmc-otrd.dtb' configuration
   Verifying Hash Integrity ... sha512,rsa4096:rsa_fitimage_key+ OK
   Trying 'ramdisk-1' ramdisk subimage
     Description:  obmc-phosphor-initramfs
     Type:         RAMDisk Image
     Compression:  uncompressed
     Data Start:   0x83464c68
     Data Size:    1069620 Bytes =3D 1 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha512
     Hash value:   =
6cf7aa53aa7b8575239fbc7dbaaedf78634a0e256bd793ef8e89471b238297d22c00bff12=
959ed9c1b1e93b1f034089f4ef138d6d0e8cb822477c3ef9b3fd854
   Verifying Hash Integrity ... sha512+ OK
## Loading fdt from FIT Image at 83000000 ...
   Using 'conf-aspeed-bmc-otrd.dtb' configuration
   Verifying Hash Integrity ... sha512,rsa4096:rsa_fitimage_key+ OK
   Trying 'fdt-aspeed-bmc-otrd.dtb' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x83456880
     Data Size:    58105 Bytes =3D 56.7 KiB
     Architecture: ARM
     Hash algo:    sha512
     Hash value:   =
24c4b99dbc39dbc885ecd05fe8fca95ed43de4df780ba5d67c3ece609d3aceceacb980297=
69710b8c0589eb598a3dc0ea3d9900c0a88045875b5aab64fc132dd
   Verifying Hash Integrity ... sha512+ OK
   Booting using the fdt blob at 0x83456880
   Loading Kernel Image ... OK
   Loading Ramdisk to 8fefa000, end 8ffff234 ... OK
   Loading Device Tree to 8fee8000, end 8fef92f8 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0xf00
[    0.000000] Linux version 5.15.50-2d28832 (oe-user@oe-host) =
(arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0, GNU ld (GNU Binutils) =
2.38.20220313) #1 SMP Thu Dec 19 11:05:13 UTC 2024
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), =
cr=3D10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing =
instruction cache
[    0.000000] OF: fdt: Machine model: AST2600 EVB
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created CMA memory pool at 0xbd000000, =
size 32 MiB
[    0.000000] OF: reserved mem: initialized node videobuffer, =
compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0xbc000000, =
size 16 MiB
[    0.000000] OF: reserved mem: initialized node framebuffer, =
compatible id shared-dma-pool
[    0.000000] cma: Reserved 16 MiB at 0xbb000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000beffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000beffffff]
[    0.000000] Initmem setup node 0 [mem =
0x0000000080000000-0x00000000beffffff]
[    0.000000] percpu: Embedded 14 pages/cpu s35660 r0 d21684 u57344
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: =
255780
[    0.000000] Kernel command line: console=3DttyS4,115200n8 =
root=3D/dev/ram rw ima_policy=3Dtcb ima_policy=3Dappraise_tcb =
resetreason=3D0x0
[    0.000000] Unknown kernel command line parameters =
"resetreason=3D0x0", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 938448K/1032192K available (11264K kernel code, =
1175K rwdata, 2344K rodata, 1024K init, 256K bss, 28208K reserved, =
65536K cma-reserved, 0K highmem)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, =
CPUs=3D2, Nodes=3D1
[    0.000000] ftrace: allocating 34110 entries in 67 pages
[    0.000000] ftrace: allocated 67 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay =
is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] arch_timer: cp15 timer(s) running at 1200.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff =
max_cycles: 0x114c1bbbeec, max_idle_ns: 440795229572 ns
[    0.000145] sched_clock: 56 bits at 1200MHz, resolution 0ns, wraps =
every 2199023255551ns
[    0.000360] Switching to timer-based delay loop, resolution 0ns
[    0.004893] Calibrating delay loop (skipped), value calculated using =
timer frequency.. 2400.00 BogoMIPS (lpj=3D12000000)
[    0.005131] pid_max: default: 32768 minimum: 301
[    0.006546] LSM: Security Framework initializing
[    0.011838] Mount-cache hash table entries: 2048 (order: 1, 8192 =
bytes, linear)
[    0.011907] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 =
bytes, linear)
[    0.028885] CPU: Testing write buffer coherency: ok
[    0.048551] Setting up static identity map for 0x80100000 - =
0x80100060
[    0.049410] rcu: Hierarchical SRCU implementation.
[    0.054349] ASPEED AST2600 rev A3 (05030303)
[    0.057336] smp: Bringing up secondary CPUs ...
[    0.064892] smp: Brought up 1 node, 2 CPUs
[    0.064994] SMP: Total of 2 processors activated (4800.00 BogoMIPS).
[    0.065054] CPU: All CPU(s) started in SVC mode.
[    0.077415] devtmpfs: initialized
[    0.109278] VFP support v0.3: implementor 41 architecture 2 part 30 =
variant 7 rev 5
[    0.125159] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.125843] futex hash table entries: 512 (order: 3, 32768 bytes, =
linear)
[    0.137556] pinctrl core: initialized pinctrl subsystem
[    0.148556] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.167804] DMA: preallocated 256 KiB pool for atomic coherent =
allocations
[    0.173810] hw-breakpoint: CPU 0 debug is powered down!
[    0.291279] usbcore: registered new interface driver usbfs
[    0.291577] usbcore: registered new interface driver hub
[    0.291797] usbcore: registered new device driver usb
[    0.292352] mc: Linux media interface: v0.10
[    0.292459] videodev: Linux video capture interface: v2.00
[    0.292587] pps_core: LinuxPPS API ver. 1 registered
[    0.292608] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 =
Rodolfo Giometti <giometti@linux.it>
[    0.292685] PTP clock support registered
[    0.292783] EDAC MC: Ver: 3.0.0
[    0.315732] clocksource: Switched to clocksource arch_sys_counter
[    0.383530] NET: Registered PF_INET protocol family
[    0.385673] IP idents hash table entries: 16384 (order: 5, 131072 =
bytes, linear)
[    0.390604] tcp_listen_portaddr_hash hash table entries: 512 (order: =
0, 6144 bytes, linear)
[    0.390713] Table-perturb hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
[    0.390795] TCP established hash table entries: 8192 (order: 3, 32768 =
bytes, linear)
[    0.391003] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, =
linear)
[    0.391207] TCP: Hash tables configured (established 8192 bind 8192)
[    0.392468] UDP hash table entries: 512 (order: 2, 16384 bytes, =
linear)
[    0.392688] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, =
linear)
[    0.394014] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.408149] RPC: Registered named UNIX socket transport module.
[    0.408219] RPC: Registered udp transport module.
[    0.408238] RPC: Registered tcp transport module.
[    0.408254] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.411732] Initialise system trusted keyrings
[    0.414452] workingset: timestamp_bits=3D14 max_order=3D18 =
bucket_order=3D4
[    0.426555] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.432152] Unpacking initramfs...
[    0.807712] NFS: Registering the id_resolver key type
[    0.808124] Key type id_resolver registered
[    0.808170] Key type id_legacy registered
[    0.808295] nfs4filelayout_init: NFSv4 File Layout Driver =
Registering...
[    0.808620] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver =
Registering...
[    1.056465] Freeing initrd memory: 1048K
[    1.059169] Key type cifs.idmap registered
[    1.059314] jffs2: version 2.2. (SUMMARY)  =C2=A9 2001-2006 Red Hat, =
Inc.
[    1.148631] NET: Registered PF_ALG protocol family
[    1.148835] Key type asymmetric registered
[    1.148917] Asymmetric key parser 'x509' registered
[    1.148975] Asymmetric key parser 'pkcs8' registered
[    1.167284] ast-kcs-bmc 1e78902c.kcs: Initialised raw client for =
channel 3
[    1.167900] ast-kcs-bmc 1e78902c.kcs: Initialised IPMI client for =
channel 3
[    1.168220] ast-kcs-bmc 1e78902c.kcs: Initialised serio client for =
channel 3
[    1.168285] ast-kcs-bmc 1e78902c.kcs: Initialised channel 3 at 0xca2
[    1.169352] ast-kcs-bmc 1e789114.kcs: Initialised raw client for =
channel 4
[    1.169608] ast-kcs-bmc 1e789114.kcs: Initialised IPMI client for =
channel 4
[    1.169659] ast-kcs-bmc 1e789114.kcs: Initialised serio client for =
channel 4
[    1.169678] ast-kcs-bmc 1e789114.kcs: Initialised channel 4 at 0xca4
[    1.184291] aspeed_bmc_dev 1e7e0000.bmc_dev: aspeed bmc device: =
driver successfully loaded.
[    1.187160] aspeed-uart-routing 1e78909c.uart_routing: module loaded
[    1.189647] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[    1.199117] 1e787000.serial: ttyS5 at MMIO 0x1e787000 (irq =3D 51, =
base_baud =3D 2343750) is a ASPEED VUART
[    1.224778] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq =3D 45, =
base_baud =3D 1500000) is a 16550A
[    1.264905] printk: console [ttyS4] enabled
[    1.271552] 1e783000.serial: ttyS0 at MMIO 0x1e783000 (irq =3D 44, =
base_baud =3D 1500000) is a 16550A
[    1.274033] 1e78e000.serial: ttyS2 at MMIO 0x1e78e000 (irq =3D 52, =
base_baud =3D 1500000) is a 16550A
[    1.276679] 1e78f000.serial: ttyS3 at MMIO 0x1e78f000 (irq =3D 53, =
base_baud =3D 1500000) is a 16550A
[    1.279800] timeriomem_rng 1e6e2524.hwrng: 32bits from 0x(ptrval) @ =
1us
[    1.292018] random: crng init done
[    1.300412] loop: module loaded
[    1.340826] spi-nor spi0.0: n25q512ax3 (65536 Kbytes)
[    1.420707] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:1 =
[0x000b0641]
[    1.425295] 5 fixed-partitions partitions found on MTD device bmc
[    1.425688] Creating 5 MTD partitions on "bmc":
[    1.426093] 0x000000000000-0x0000000e0000 : "u-boot"
[    1.428672] 0x0000000e0000-0x000000100000 : "u-boot-env"
[    1.430505] 0x000000100000-0x000000a00000 : "kernel"
[    1.432303] 0x000000a00000-0x000003100000 : "rofs"
[    1.434124] 0x000003100000-0x000004000000 : "rwfs"
[    1.437230] spi-nor spi0.1: n25q512ax3 (65536 Kbytes)
[    1.516186] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:1 =
[0x000b0641]
[    1.518870] 5 fixed-partitions partitions found on MTD device alt-bmc
[    1.519196] Creating 5 MTD partitions on "alt-bmc":
[    1.519429] 0x000000000000-0x0000000e0000 : "alt-u-boot"
[    1.521381] 0x0000000e0000-0x000000100000 : "alt-u-boot-env"
[    1.523289] 0x000000100000-0x000000a00000 : "alt-kernel"
[    1.525594] 0x000000a00000-0x000003100000 : "alt-rofs"
[    1.527641] 0x000003100000-0x000004000000 : "alt-rwfs"
[    1.536605] spi-nor spi1.0: mx25l25635e (32768 Kbytes)
[    1.540286] spi-aspeed-smc 1e630000.spi: Calibration area too =
uniform, using low speed
[    1.540704] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 =
[0x203b0041]
[    1.557544] ftgmac100 1e670000.ftgmac: Read MAC address =
06:ec:b7:d4:82:3b from chip
[    1.559489] RTL8211E Gigabit Ethernet 1e650008.mdio-1:00: attached =
PHY driver (mii_bus:phy_addr=3D1e650008.mdio-1:00, irq=3DPOLL)
[    1.561286] ftgmac100 1e670000.ftgmac eth0: irq 33, mapped at =
32fcb78e
[    1.562381] ftgmac100 1e690000.ftgmac: Read MAC address =
06:03:86:e2:d3:d1 from chip
[    1.562804] ftgmac100 1e690000.ftgmac: Using NCSI interface
[    1.564460] ftgmac100 1e690000.ftgmac eth1: irq 34, mapped at =
587925db
[    1.565328] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) =
Driver
[    1.565812] ehci-platform: EHCI generic platform driver
[    1.583084] aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in =
USB2 mode
[    1.585586] i2c_dev: i2c /dev entries driver
[    1.588936] aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 0 registered, =
irq 55
[    1.595194] at24 1-0050: 32768 byte 24c256 EEPROM, writable, 1 =
bytes/write
[    1.595905] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 1 registered, =
irq 56
[    1.597662] aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus 2 registered, =
irq 57
[    1.599696] aspeed-i2c-bus 1e78a280.i2c-bus: i2c bus 4 registered, =
irq 58
[    1.601083] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 5 registered, =
irq 59
[    1.602587] aspeed-i2c-bus 1e78a380.i2c-bus: i2c bus 6 registered, =
irq 60
[    1.604542] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 registered, =
irq 61
[    1.606147] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 registered, =
irq 62
[    1.607285] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 registered, =
irq 63
[    1.609092] pca953x 10-0021: using no AI
[    1.611312] pca953x 10-0021: failed writing register
[    1.612812] pca953x 10-0022: using no AI
[    1.613380] pca953x 10-0022: failed writing register
[    1.614180] pca953x 10-0023: using no AI
[    1.614755] pca953x 10-0023: failed writing register
[    1.615513] aspeed-i2c-bus 1e78a580.i2c-bus: i2c bus 10 registered, =
irq 64
[    1.617371] aspeed-i2c-bus 1e78a600.i2c-bus: i2c bus 11 registered, =
irq 65
[    1.618512] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 registered, =
irq 66
[    1.619635] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 registered, =
irq 67
[    1.623079] i2c i2c-2: Added multiplexed i2c bus 200
[    1.623852] i2c i2c-2: Added multiplexed i2c bus 628
[    1.624517] i2c i2c-2: Added multiplexed i2c bus 629
[    1.625415] i2c i2c-2: Added multiplexed i2c bus 630
[    1.625726] pca954x 2-0070: registered 4 multiplexed busses for I2C =
switch pca9546
[    1.626761] pca954x 5-0070: probe failed
[    1.627493] pca954x 6-0070: probe failed
[    1.628342] videocap 1e700000.video: AST Video Engine Driver Probe.
[    1.628746] videocap 1e700000.video: reg base =3D 0xbf8c1000
[    1.629668] videocap 1e700000.video: assigned reserved memory node =
videobuffer
[    1.689448] videocap 1e700000.video: video buf phys addr: 0xbd000000
[    1.689849] videocap 1e700000.video: video buf virt addr: 0xd0419e89
[    1.690376] videocap 1e700000.video: vga memory use addr:0xbc000000, =
size =3D 0x4000000
[    1.690856] ------------[ cut here ]------------
[    1.691203] WARNING: CPU: 1 PID: 1 at arch/arm/mm/ioremap.c:288 =
__arm_ioremap_pfn_caller+0xec/0x1c8
[    1.692463] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.15.50-2d28832 =
#1
[    1.692889] Hardware name: Generic DT based system
[    1.693322] Backtrace:
[    1.693617] [<80b33dd8>] (dump_backtrace) from [<80b33fd0>] =
(show_stack+0x20/0x24)
[    1.694179]  r7:00000120 r6:00000009 r5:60000013 r4:80d6aae4
[    1.694513] [<80b33fb0>] (show_stack) from [<80b403cc>] =
(dump_stack_lvl+0x48/0x54)
[    1.694921] [<80b40384>] (dump_stack_lvl) from [<80b403f0>] =
(dump_stack+0x18/0x1c)
[    1.695301]  r5:801174e8 r4:80d569a0
[    1.695470] [<80b403d8>] (dump_stack) from [<80121220>] =
(__warn+0xf8/0x154)
[    1.695796] [<80121128>] (__warn) from [<80b346c8>] =
(warn_slowpath_fmt+0x8c/0xc0)
[    1.696155]  r7:00000120 r6:80d569a0 r5:00000000 r4:8150a000
[    1.696412] [<80b34640>] (warn_slowpath_fmt) from [<801174e8>] =
(__arm_ioremap_pfn_caller+0xec/0x1c8)
[    1.696841]  r9:00000001 r8:00000000 r7:bc000000 r6:80e2e0a4 =
r5:00000000 r4:04000000
[    1.697191] [<801173fc>] (__arm_ioremap_pfn_caller) from [<8011761c>] =
(__arm_ioremap_caller+0x58/0x60)
[    1.697608]  r9:816e8968 r8:80e00660 r7:bc000000 r6:816e8940 =
r5:04000000 r4:801175c4
[    1.697948] [<801175c4>] (__arm_ioremap_caller) from [<801177fc>] =
(ioremap+0x2c/0x30)
[    1.698310] [<801177d0>] (ioremap) from [<8084fb4c>] =
(ast_videocap_remap_vga_mem+0xbc/0x100)
[    1.698695]  r5:04000000 r4:8150a000
[    1.698859] [<8084fa90>] (ast_videocap_remap_vga_mem) from =
[<80b3e110>] (ast_videocap_probe+0x3e4/0x640)
[    1.699295]  r7:815fe410 r6:815fe410 r5:00000000 r4:816e8940
[    1.699549] [<80b3dd2c>] (ast_videocap_probe) from [<8072ba70>] =
(platform_probe+0x6c/0xcc)
[    1.699929]  r10:81126000 r9:80f4e85c r8:00000000 r7:815fe410 =
r6:810ceddc r5:815fe410
[    1.700288]  r4:00000000
[    1.700415] [<8072ba04>] (platform_probe) from [<80729170>] =
(really_probe+0x1d8/0x478)
[    1.700778]  r7:815fe410 r6:810ceddc r5:00000000 r4:815fe410
[    1.701038] [<80728f98>] (really_probe) from [<80729538>] =
(__driver_probe_device+0x128/0x204)
[    1.701438]  r6:810ceddc r5:810ceddc r4:815fe410
[    1.701637] [<80729410>] (__driver_probe_device) from [<80729658>] =
(driver_probe_device+0x44/0xd4)
[    1.702056]  r9:80f4e85c r8:00000000 r7:815fe410 r6:810ceddc =
r5:8114fe54 r4:8114fd48
[    1.702393] [<80729614>] (driver_probe_device) from [<807299b4>] =
(__driver_attach+0xa4/0x1cc)
[    1.702793]  r9:80f4e85c r8:81eccd38 r7:00000000 r6:810ceddc =
r5:815fe454 r4:815fe410
[    1.703136] [<80729910>] (__driver_attach) from [<80726d08>] =
(bus_for_each_dev+0x88/0xc8)
[    1.703518]  r7:00000000 r6:8150a000 r5:80729910 r4:810ceddc
[    1.703780] [<80726c80>] (bus_for_each_dev) from [<8072a108>] =
(driver_attach+0x2c/0x30)
[    1.704154]  r7:810c13b0 r6:00000000 r5:81eccd00 r4:810ceddc
[    1.704411] [<8072a0dc>] (driver_attach) from [<80727698>] =
(bus_add_driver+0x124/0x20c)
[    1.704773] [<80727574>] (bus_add_driver) from [<8072ab84>] =
(driver_register+0x98/0x128)
[    1.705151]  r8:00000000 r7:80f4e83c r6:8150a000 r5:00000000 =
r4:810ceddc
[    1.705452] [<8072aaec>] (driver_register) from [<8072ce50>] =
(__platform_driver_register+0x2c/0x34)
[    1.705882]  r5:814cd580 r4:80f2994c
[    1.706053] [<8072ce24>] (__platform_driver_register) from =
[<80f29970>] (ast_videocap_driver_init+0x24/0x28)
[    1.706543] [<80f2994c>] (ast_videocap_driver_init) from [<80f01658>] =
(do_one_initcall+0x8c/0x190)
[    1.706957] [<80f015cc>] (do_one_initcall) from [<80f01a1c>] =
(kernel_init_freeable+0x25c/0x2bc)
[    1.707355]  r8:0000010a r7:80f4e83c r6:00000007 r5:814cd580 =
r4:80f7bbe4
[    1.707657] [<80f017c0>] (kernel_init_freeable) from [<80b40bac>] =
(kernel_init+0x20/0x138)
[    1.708042]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 =
r6:00000000 r5:80b40b8c
[    1.708401]  r4:00000000
[    1.708520] [<80b40b8c>] (kernel_init) from [<80100130>] =
(ret_from_fork+0x14/0x24)
[    1.708901] Exception stack(0x8150bfb0 to 0x8150bff8)
[    1.709287] bfa0:                                     00000000 =
00000000 00000000 00000000
[    1.709683] bfc0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[    1.710065] bfe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
[    1.710398]  r5:80b40b8c r4:00000000
[    1.710807] ---[ end trace fa9c808777df4f4c ]---
[    1.711167] videocap 1e700000.video: vga memory ioremap failed
[    1.711463] videocap 1e700000.video: vga memory alloc failed
[    1.750587] videocap: probe of 1e700000.video failed with error -12
[    1.751517] Driver for 1-wire Dallas network protocol.
[    1.756422] emc1403 200-004c: emc1413 Thermal chip found
[    1.758844] ina2xx 7-0045: error configuring the device: -6
[    1.762909] lm75 200-0049: hwmon1: sensor 'tmp112'
[    1.766024] otrd-psm7 11-0058: PMBus status register not found
[    1.767173] otrd-psm7 11-0059: PMBus status register not found
[    1.769634] #### otrd pwm tacho probe ok ####
[    1.770341] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is =
disabled. Duplicate IMA measurements will not be recorded in the IMA =
log.
[    1.772032] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) =
initialised: dm-devel@redhat.com
[    1.773962] sdhci: Secure Digital Host Controller Interface driver
[    1.774340] sdhci: Copyright(c) Pierre Ossman
[    1.774600] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.782561] usbcore: registered new interface driver usbhid
[    1.782889] usbhid: USB HID core driver
[    1.783124] sdhci-aspeed 1e740100.sdhci: Configured for slot 0
[    1.791853] SPI driver bmp280 has no spi_device_id for bosch,bmp085
[    1.795352] sdhci-aspeed 1e750100.sdhci: Configured for slot 0
[    1.796692] peci peci-0: cdev of adapter [1e78b000.peci-bus] =
registered as minor 0
[    1.828577] mmc0: SDHCI controller on 1e740100.sdhci [1e740100.sdhci] =
using ADMA
[    1.831479] mmc1: SDHCI controller on 1e750100.sdhci [1e750100.sdhci] =
using ADMA
[    2.815604] peci peci-0: Failed to register peci client  at 0x30 (-5)
[    2.816016] peci peci-0: Failed to create PECI device for =
/ahb/apb/bus@1e78b000/peci-bus@0/peci-client@30
[    3.855569] peci peci-0: Failed to register peci client  at 0x31 (-5)
[    3.856017] peci peci-0: Failed to create PECI device for =
/ahb/apb/bus@1e78b000/peci-bus@0/peci-client@31
[    3.856687] peci_aspeed 1e78b000.peci-bus: peci bus 0 registered, irq =
46
[    3.866934] NET: Registered PF_INET6 protocol family
[    3.875330] Segment Routing with IPv6
[    3.875703] In-situ OAM (IOAM) with IPv6
[    3.876899] NET: Registered PF_PACKET protocol family
[    3.877770] 8021q: 802.1Q VLAN Support v1.8
[    3.878355] Key type dns_resolver registered
[    3.878909] Registering SWP/SWPB emulation handler
[    3.879551] Loading compiled-in X.509 certificates
[    3.889646] Key type encrypted registered
[    3.890359] ima: No TPM chip found, activating TPM-bypass!
[    3.890794] ima: Allocated hash algorithm: sha256
[    3.893839] ima: No architecture policies found
[    3.894914] evm: Initialising EVM extended attributes:
[    3.895392] evm: security.selinux (disabled)
[    3.895728] evm: security.SMACK64 (disabled)
[    3.895939] evm: security.SMACK64EXEC (disabled)
[    3.896142] evm: security.SMACK64TRANSMUTE (disabled)
[    3.896360] evm: security.SMACK64MMAP (disabled)
[    3.896556] evm: security.apparmor (disabled)
[    3.896758] evm: security.ima (disabled)
[    3.896942] evm: security.capability
[    3.897115] evm: HMAC attrs: 0x1
[    3.909386] printk: console [netcon0] enabled
[    3.909678] netconsole: network logging started
[    3.913771] input: gpio-keys as =
/devices/platform/gpio-keys/input/input0
[    3.961395] Freeing unused kernel image (initmem) memory: 1024K
[    4.035127] Checked W+X mappings: passed, no W+X pages found
[    4.035759] Run /init as init process
rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2
[    6.288036] squashfs: SQUASHFS error: Xattrs in filesystem, these =
will be ignored
[    6.290710] unable to read xattr id index table
[    6.524591] jffs2: notice: (153) jffs2_build_xattr_subsystem: =
complete building xattr subsystem, 38 of xdatum (38 unchecked, 0 orphan) =
and 56 of xref (0 dead, 0 orphan) found.
[    6.642278] overlayfs: upper fs does not support tmpfile.
[    9.588558] systemd[1]: Failed to look up module alias 'autofs4': =
Function not implemented
[    9.701208] systemd[1]: systemd 250 running in system mode (+PAM =
-AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS -OPENSSL =
-ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP =
+LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB =
+ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT =
default-hierarchy=3Dhybrid)
[    9.708800] systemd[1]: Detected architecture arm.

Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) =
4.3.3_Pre!

[    9.826535] systemd[1]: Hostname set to <NULL>.
[   12.366801] systemd[163]: =
/lib/systemd/system-generators/systemd-gpt-auto-generator failed with =
exit status 1.
[   14.858000] systemd[1]: =
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, =
ignoring: sys-subsystem-net-devices-%i.device
[   14.871900] systemd[1]: =
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, =
ignoring: sys-subsystem-net-devices-%i.device
[   15.001411] systemd[1]: Queued start job for default target =
Multi-User System.
[   15.187766] systemd[1]: Created slice Slice /system/getty.
[  OK  ] Created slice Slice /system/getty.
[   15.203418] systemd[1]: Created slice Slice /system/mapper-wait.
[  OK  ] Created slice Slice /system/mapper-wait.
[   15.215153] systemd[1]: Created slice Slice /system/modprobe.
[  OK  ] Created slice Slice /system/modprobe.
[   15.226655] systemd[1]: Created slice Slice /system/obmc-console.
[  OK  ] Created slice Slice /system/obmc-console.
[   15.237415] systemd[1]: Created slice Slice /system/obmc-console-bmc.
[  OK  ] Created slice Slice /system/obmc-console-bmc.
[   15.249397] systemd[1]: Created slice Slice =
/system/obmc-led-group-start.
[  OK  ] Created slice Slice /system/obmc-led-group-start.
[   15.260848] systemd[1]: Created slice Slice =
/system/phosphor-certificate-manager.
[  OK  ] Created slice Slice /system/phosphor-certificate-manager.
[   15.272364] systemd[1]: Created slice Slice =
/system/phosphor-ipmi-kcs.
[  OK  ] Created slice Slice /system/phosphor-ipmi-kcs.
[   15.284337] systemd[1]: Created slice Slice =
/system/phosphor-ipmi-net.
[  OK  ] Created slice Slice /system/phosphor-ipmi-net.
[   15.296106] systemd[1]: Created slice Slice /system/serial-getty.
[  OK  ] Created slice Slice /system/serial-getty.
[   15.307491] systemd[1]: Created slice Slice =
/system/xyz.openbmc_project.Chassis.Control.Power.
[  OK  ] Created slice Slice =
/syste=E2=80=A6project.Chassis.Control.Power.
[   15.314521] systemd[1]: Started Dispatch Password Requests to Console =
Directory Watch.
[  OK  ] Started Dispatch Password =E2=80=A6ts to Console Directory =
Watch.
[   15.320129] systemd[1]: Started Forward Password Requests to Wall =
Directory Watch.
[  OK  ] Started Forward Password R=E2=80=A6uests to Wall Directory =
Watch.
[   15.325773] systemd[1]: Reached target Path Units.
[  OK  ] Reached target Path Units.
[   15.328328] systemd[1]: Reached target Remote File Systems.
[  OK  ] Reached target Remote File Systems.
[   15.330728] systemd[1]: Reached target Slice Units.
[  OK  ] Reached target Slice Units.
[   15.333194] systemd[1]: Reached target Swaps.
[  OK  ] Reached target Swaps.
[   15.349570] systemd[1]: Listening on Syslog Socket.
[  OK  ] Listening on Syslog Socket.
[   15.384193] systemd[1]: Listening on Process Core Dump Socket.
[  OK  ] Listening on Process Core Dump Socket.
[   15.389388] systemd[1]: Listening on initctl Compatibility Named =
Pipe.
[  OK  ] Listening on initctl Compatibility Named Pipe.
[   15.394803] systemd[1]: Journal Audit Socket was skipped because of a =
failed condition check (ConditionSecurity=3Daudit).
[   15.400684] systemd[1]: Listening on Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket (/dev/log).
[   15.407177] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[   15.414384] systemd[1]: Listening on Network Service Netlink Socket.
[  OK  ] Listening on Network Service Netlink Socket.
[   15.427272] systemd[1]: Listening on udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[   15.432765] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[   15.439735] systemd[1]: Huge Pages File System was skipped because of =
a failed condition check =
(ConditionPathExists=3D/sys/kernel/mm/hugepages).
[   15.443416] systemd[1]: POSIX Message Queue File System was skipped =
because of a failed condition check =
(ConditionPathExists=3D/proc/sys/fs/mqueue).
[   15.469317] systemd[1]: Mounting Kernel Debug File System...
         Mounting Kernel Debug File System...
[   15.491598] systemd[1]: Mounting Kernel Trace File System...
         Mounting Kernel Trace File System...
[   15.520398] systemd[1]: Mounting Temporary Directory /tmp...
         Mounting Temporary Directory /tmp...
[   15.536673] systemd[1]: Create List of Static Device Nodes was =
skipped because of a failed condition check =
(ConditionFileNotEmpty=3D/lib/modules/5.15.50-2d28832/modules.devname).
[   15.628499] systemd[1]: Starting Load Kernel Module configfs...
         Starting Load Kernel Module configfs...
[   15.642037] systemd[1]: File System Check on Root Device was skipped =
because of a failed condition check (ConditionPathIsReadWrite=3D!/).
[   15.706622] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[   15.743379] systemd[1]: Load Kernel Modules was skipped because all =
trigger condition checks failed.
[   15.765540] systemd[1]: Starting Generate network units from Kernel =
command line...
         Starting Generate network =E2=80=A6ts from Kernel command =
line...
[   15.805240] systemd[1]: Starting Remount Root and Kernel File =
Systems...
         Starting Remount Root and Kernel File Systems...
[   15.863139] systemd[1]: Starting Apply Kernel Variables...
         Starting Apply Kernel Variables...
[   15.951792] systemd[1]: Starting Coldplug All udev Devices...
         Starting Coldplug All udev Devices...
[   16.188251] systemd[1]: Mounted Kernel Debug File System.
[  OK  ] Mounted Kernel Debug File System.
[   16.209755] systemd[1]: Mounted Kernel Trace File System.
[  OK  ] Mounted Kernel Trace File System.
[   16.214304] systemd[1]: Mounted Temporary Directory /tmp.
[  OK  ] Mounted Temporary Directory /tmp.
[   16.239644] systemd[1]: modprobe@configfs.service: Deactivated =
successfully.
[   16.263473] systemd[1]: Finished Load Kernel Module configfs.
[  OK  ] Finished Load Kernel Module configfs.
[   16.387714] systemd[1]: Finished Generate network units from Kernel =
command line.
[  OK  ] Finished Generate network units from Kernel command line.
[   16.715708] systemd[1]: Finished Remount Root and Kernel File =
Systems.
[  OK  ] Finished Remount Root and Kernel File Systems.
[   16.746520] systemd[1]: Finished Apply Kernel Variables.
[  OK  ] Finished Apply Kernel Variables.
[   16.754785] systemd[1]: Reached target Preparation for Network.
[  OK  ] Reached target Preparation for Network.
[   16.796095] systemd[1]: Mounting Kernel Configuration File System...
         Mounting Kernel Configuration File System...
[   16.813317] systemd[1]: Rebuild Hardware Database was skipped because =
of a failed condition check (ConditionNeedsUpdate=3D/etc).
[   16.826622] systemd[1]: Platform Persistent Storage Archival was =
skipped because of a failed condition check =
(ConditionDirectoryNotEmpty=3D/sys/fs/pstore).
[   16.829888] systemd[1]: Create System Users was skipped because of a =
failed condition check (ConditionNeedsUpdate=3D/etc).
[   16.871905] systemd[1]: Starting Create Static Device Nodes in =
/dev...
         Starting Create Static Device Nodes in /dev...
[   16.956124] systemd[1]: Mounted Kernel Configuration File System.
[  OK  ] Mounted Kernel Configuration File System.
[   17.235679] systemd[1]: Finished Create Static Device Nodes in /dev.
[  OK  ] Finished Create Static Device Nodes in /dev.
[   17.239888] systemd[1]: Reached target Preparation for Local File =
Systems.
[  OK  ] Reached target Preparation for Local File Systems.
[   17.280023] systemd[1]: Mounting /var/volatile...
         Mounting /var/volatile...
[   17.358707] systemd[1]: Starting Rule-based Manager for Device Events =
and Files...
         Starting Rule-based Manage=E2=80=A6for Device Events and =
Files...
[   17.456364] systemd[1]: Mounted /var/volatile.
[  OK  ] Mounted /var/volatile.
[   17.472228] systemd[1]: Bind mount volatile /var/cache was skipped =
because of a failed condition check =
(ConditionPathIsReadWrite=3D!/var/cache).
[   17.474480] systemd[1]: Bind mount volatile /var/lib was skipped =
because of a failed condition check =
(ConditionPathIsReadWrite=3D!/var/lib).
[   17.538662] systemd[1]: Starting Load/Save Random Seed...
         Starting Load/Save Random Seed...
[   17.546580] systemd[1]: Bind mount volatile /var/spool was skipped =
because of a failed condition check =
(ConditionPathIsReadWrite=3D!/var/spool).
[   17.550459] systemd[1]: Bind mount volatile /srv was skipped because =
of a failed condition check (ConditionPathIsReadWrite=3D!/srv).
[   17.552029] systemd[1]: Reached target Local File Systems.
[  OK  ] Reached target Local File Systems.
[   18.018500] systemd[1]: Finished Load/Save Random Seed.
[  OK  ] Finished Load/Save Random Seed.
[   18.023987] systemd[1]: First Boot Complete was skipped because of a =
failed condition check (ConditionFirstBoot=3Dyes).
[   18.037075] systemd[1]: Commit a transient machine-id on disk was =
skipped because of a failed condition check =
(ConditionPathIsMountPoint=3D/etc/machine-id).
[   18.421406] systemd[1]: Started Rule-based Manager for Device Events =
and Files.
[  OK  ] Started Rule-based Manager for Device Events and Files.
[   19.044031] systemd[1]: Started Journal Service.
[  OK  ] Started Journal Service.
         Starting Flush Journal to Persistent Storage...
[   19.377905] systemd-journald[176]: Received client request to flush =
runtime journal.
[  OK  ] Finished Flush Journal to Persistent Storage.
         Starting Create Volatile Files and Directories...
[  OK  ] Finished Create Volatile Files and Directories.
         Starting Record System Boot/Shutdown in UTMP...
[  OK  ] Finished Record System Boot/Shutdown in UTMP.
[  OK  ] Finished Coldplug All udev Devices.
[  OK  ] Found device /sys/subsystem/net/devices/eth1.
[  OK  ] Found device /sys/subsystem/net/devices/eth0.
[  OK  ] Found device /dev/ttyS5.
[  OK  ] Created slice Slice /system/obmc-read-eeprom.
[  OK  ] Created slice Slice =
/syste=E2=80=A6penbmc_project.led.controller.
[  OK  ] Reached target Hardware activated USB gadget.
         Starting Wait for udev To =E2=80=A6plete Device =
Initialization...
[  OK  ] Finished Wait for udev To Complete Device Initialization.
[  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
[  OK  ] Reached target System Initialization.
[  OK  ] Started Daily rotation of log files.
[  OK  ] Started Run rotate-event-logs.service every minute.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target Timer Units.
[  OK  ] Listening on BMC Webserver socket.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Listening on dropbear.socket.
[  OK  ] Listening on Redirect HTTP to HTTPS socket.
[  OK  ] Listening on Phosphor BMC =E2=80=A6ole SSH Per-Connection =
socket.
[  OK  ] Listening on Phosphor Netc=E2=80=A6ole SSH Per-Connection =
socket.
[  OK  ] Listening on Phosphor Host=E2=80=A6ole SSH Per-Connection =
socket.
[  OK  ] Listening on phosphor-ipmi-net@eth0.socket.
[  OK  ] Listening on phosphor-ipmi-net@eth1.socket.
[  OK  ] Reached target Socket Units.
         Starting D-Bus System Message Bus...
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Reached target Basic System.
         Starting Clear one time boot overrides...
         Starting Intel BMC CPU Crashdump...
         Starting SSH Key Generation...
[  OK  ] Started In-band Upgrade.
[  OK  ] Started LPC Snoop Daemon.
         Starting Name Service Cache Daemon...
[  OK  ] Started ttyS3 Console Server.
         Starting Phosphor Console =E2=80=A6tening on device =
/dev/ttyS5...
[  OK  ] Started Phosphor Dump core monitor..
         Starting Mount the alt par=E2=80=A6s for static layout =
systems...
         Starting Otrd BMC Firewall...
[  OK  ] Started Otrd cpld monitor.
         Starting Otrd BMC daemon monitor...
         Starting Otrd EEPROM...
[  OK  ] Started otrd log.
[   29.610750] squashfs: SQUASHFS error: Xattrs in filesystem, these =
will be ignored
[   29.611237] unable to read xattr id index table
[  OK  ] Started Phosphor certificate manager for authority.
[  OK  ] Started Phosphor certificate manager for bmcweb.
[  OK  ] Started Phosphor certificate manager for doubleFactor.
[  OK  ] Started Phosphor certifica=E2=80=A6 manager for =
doubleFactorAuth.
[  OK  ] Started Phosphor certificate manager for nslcd.
         Starting Phosphor Watchdog...
         Starting Rotates the event logs...
         Starting Daemon to control service configuration...
         Starting Enable Linux trace events in the boot loader...
         Starting Phosphor Dump Manager...
         Starting Entity Manager...
[  OK  ] Started Fru Device.
         Starting Phosphor Inventory Manager...
         Starting Phosphor Log Manager...
         Starting Phosphor DBus Service Discovery Manager...
         Starting Phosphor Settings Daemon...
         Starting Phosphor Download Manager...
         Starting Post code manager...
         Starting Rsyslog config updater...
         Starting Telemetry...
         Starting Phosphor User Manager...
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Started Phosphor sysfs LED controller.
[  OK  ] Finished SSH Key Generation.
[  OK  ] Started Name Service Cache Daemon.
[  OK  ] Finished Mount the alt par=E2=80=A6ons for static layout =
systems.
[  OK  ] Finished Rotates the event logs.
[  OK  ] Finished Enable Linux trace events in the boot loader.
[  OK  ] Finished Clear one time boot overrides.
[  OK  ] Started Phosphor DBus Service Discovery Manager.
[  OK  ] Started Intel BMC CPU Crashdump.
[  OK  ] Started Rsyslog config updater.
[  OK  ] Started Telemetry.
[  OK  ] Started Phosphor Settings Daemon.
[  OK  ] Started Phosphor Download Manager.
[  OK  ] Started Otrd BMC daemon monitor.
[  OK  ] Started Phosphor Console M=E2=80=A6istening on device =
/dev/ttyS5.
[  OK  ] Started Daemon to control service configuration.
[  OK  ] Started Otrd BMC Firewall.
[  OK  ] Started Post code manager.
[  OK  ] Started Phosphor Watchdog.
[  OK  ] Started Phosphor User Manager.
[  OK  ] Started Entity Manager.
[  OK  ] Reached target Phosphor Object Mapper.
         Starting Wait for /com/otrd/Ipmi/Sdr...
         Starting Wait for /com/otrd/eeprom/timeSync...
         Starting Wait for /com/otrd/sensor/monitor...
         Starting Wait for =
/xyz/ope=E2=80=A6control/host0/boot/one_time...
         Starting Wait for =
/xyz/ope=E2=80=A6_project/control/host0/boot...
         Starting Wait for =
/xyz/ope=E2=80=A6/host0/power_restore_policy...
         Starting Wait for =
/xyz/ope=E2=80=A6trol/host0/restriction_mode...
         Starting Wait for /xyz/openbmc_project/events...
         Starting Wait for =
/xyz/ope=E2=80=A6oject/led/groups/bmc_booted...
         Starting Wait for =
/xyz/ope=E2=80=A6mc_project/time/sync_method...
[  OK  ] Started Otrd Devicie Probe Service.
         Starting Virtual sensors...
         Starting Phosphor LED Group Management Daemon...
         Starting Phosphor Ldap config updater...
         Starting OpenBMC Software Update Manager...
[  OK  ] Started Adc Sensor.
[  OK  ] Started CPU Sensor.
[  OK  ] Started Fan Sensor.
[  OK  ] Started Hwmon Temp Sensor.
[  OK  ] Started IPMB Sensor.
[  OK  ] Started NVMe Sensor.
[  OK  ] Started Pcie Sensor.
[  OK  ] Finished Wait for /com/otrd/eeprom/timeSync.
[  OK  ] Finished Wait for =
/xyz/ope=E2=80=A6t/control/host0/boot/one_time.
[  OK  ] Finished Wait for =
/xyz/ope=E2=80=A6mc_project/control/host0/boot.
[  OK  ] Finished Wait for =
/xyz/ope=E2=80=A6ol/host0/power_restore_policy.
[  OK  ] Finished Wait for =
/xyz/ope=E2=80=A6ontrol/host0/restriction_mode.
[  OK  ] Finished Wait for /xyz/openbmc_project/time/sync_method.
[  OK  ] Started Phosphor Inventory Manager.
[  OK  ] Started Phosphor Dump Manager.
[  OK  ] Started Otrd EEPROM.
[  OK  ] Started Phosphor LED Group Management Daemon.
         Starting Phosphor Inband IPMI...
         Starting Otrd Host to BMC Manager...
         Starting lldpd-config-override.service...
         Starting Wait for /xyz/openbmc_project/inventory...
         Starting Wait for /xyz/openbmc_project/led/groups...
[  OK  ] Created slice Slice /system/nslcd.
         Starting Ramoops monitor....
[  OK  ] Finished Wait for =
/xyz/ope=E2=80=A6project/led/groups/bmc_booted.
[  OK  ] Finished Wait for /xyz/openbmc_project/inventory.
[  OK  ] Finished Wait for /xyz/openbmc_project/led/groups.
[  OK  ] Started Phosphor Ldap config updater.
[  OK  ] Started OpenBMC Software Update Manager.
[  OK  ] Started Otrd Host to BMC Manager.
         Starting Otrd Asset Manager...
[  OK  ] Started FRU Fault monitor service.
         Starting Read 1-0050 EEPROM...
[  OK  ] Started task info.
         Starting Backup Image Update...
         Starting Rotates the event logs...
         Starting Phosphor Sync Man=E2=80=A6s to the alternate BMC =
chip...
         Starting Phosphor Version Software Manager...
[  OK  ] Finished Ramoops monitor..
[FAILED] Failed to start Backup Image Update.
See 'systemctl status otrd-backup-image-update.service' for details.
[  OK  ] Finished Rotates the event logs.
[  OK  ] Started Otrd Asset Manager.
[  OK  ] Started Virtual sensors.
[  OK  ] Finished Read 1-0050 EEPROM.
         Starting Init BMC Hostname...
[   64.550469] systemd-journald[176]: Data hash table of =
/run/log/journal/03c40c639f754e55ada2ceaf1c42b854/system.journal has a =
fill level at 75.1 (2732 of 3640 items, 2097152 file size, 767 bytes per =
hash table item), suggesting rotation.
[   64.554688] systemd-journald[176]: =
/run/log/journal/03c40c639f754e55ada2ceaf1c42b854/system.journal: =
Journal header limits reached or header out-of-date, rotating.
[  OK  ] Started Phosphor Version Software Manager.
[   64.710096] jffs2: notice: (402) jffs2_build_xattr_subsystem: =
complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) =
and 0 of xref (0 dead, 0 orphan) found.
         Starting Otrd CPLD FW Manager...
[  OK  ] Started Otrd CPLD FW Manager.
[*     ] (1 of 8) A start job is running for=E2=80=A6mc_project/events =
(44s / no limit)
[   78.981944] i2c i2c-11: delete_device: Can't find device in list
[   79.018662] i2c i2c-11: delete_device: Can't find device in list
[   81.072134] i2c i2c-11: delete_device: Can't find device in list
[   81.107667] i2c i2c-11: delete_device: Can't find device in list
[   81.768809] i2c i2c-11: delete_device: Can't find device in list
[   81.773417] i2c i2c-11: delete_device: Can't find device in list
[   82.277070] i2c i2c-11: delete_device: Can't find device in list
[   82.281847] i2c i2c-11: delete_device: Can't find device in list
[   82.784560] i2c i2c-11: delete_device: Can't find device in list
[  OK  ] Finished Wait for /com/otrd/Ipmi/Sdr.
[  OK  ] Finished lldpd-config-override.service.
[  OK  ] Started Phosphor Sync Mana=E2=80=A6les to the alternate BMC =
chip.
[  OK  ] Started Phosphor Log Manager.
[  OK  ] Started Phosphor Inband IPMI.
[  OK  ] Started IPMB bridge.
[  OK  ] Started Node Manager Proxy.
[  OK  ] Started Otrd history record.
[  OK  ] Started Otrd sensor monitor.
[  OK  ] Started Otrd hardware monitor.
[  OK  ] Started Network IPMI daemon.
[  OK  ] Started Network IPMI daemon.
[  OK  ] Started phosphor systemd target monitor.
         Starting Hostname Service...
         Starting Phosphor BMC State Manager...
         Starting Phosphor Time Manager daemon...
[FAILED] Failed to start Init BMC Hostname.
See 'systemctl status first-boot-set-hostname.service' for details.
         Starting Network Configuration...
[  OK  ] Started Phosphor BMC State Manager.
[  OK  ] Started Hostname Service.
[  OK  ] Started Network Configuration.
[  OK  ] Created slice Slice /system/bondInterface.
[  100.382846] 8021q: adding VLAN 0 to HW filter on device eth1
[  100.388020] bond1: (slave eth1): Enslaving as a backup interface with =
an up link
[  OK  ] Started bond interface change add.
[  100.659358] bond1: (slave eth0): Enslaving as a backup interface with =
a down link
[  100.661768] ftgmac100 1e670000.ftgmac eth0: Link is Up - 100Mbps/Full =
- flow control rx/tx
         Starting Network Name Resolution...
[  100.871305] bond1: (slave eth0): link status up, enabling it in 2000 =
ms
[  100.871577] 8021q: adding VLAN 0 to HW filter on device bond1
[  100.885387] bond1: (slave eth0): link status up, enabling it in 2000 =
ms
[  100.886388] bond1: (slave eth1): link status definitely up, 0 Mbps =
full duplex
[  100.887148] bond1: (slave eth1): making interface the new active one
[  100.888637] bond1: active interface up!
[  100.889064] bond1: (slave eth0): invalid new link 3 on slave
[  100.889710] IPv6: ADDRCONF(NETDEV_CHANGE): bond1: link becomes ready
         Starting Phosphor Network Manager...
[  OK  ] Started Phosphor Network Manager.
         Stopping Network IPMI daemon...
[  OK  ] Stopped Network IPMI daemon.
[  OK  ] Closed phosphor-ipmi-net@eth0.socket.
         Stopping Network IPMI daemon...
[  OK  ] Stopped Network IPMI daemon.
[  OK  ] Closed phosphor-ipmi-net@eth1.socket.
[  102.975549] bond1: (slave eth0): link status definitely up, 100 Mbps =
full duplex
[  102.976331] bond1: (slave eth0): making interface the new active one
[  OK  ] Started Network Name Resolution.
[  OK  ] Reached target Network.
[  OK  ] Reached target Network is Online.
[  OK  ] Reached target Host and Network Name Lookups.
[  OK  ] Started Start bmcweb server.
[  OK  ] Started LDAP nslcd-ad server.
[  OK  ] Started LDAP nslcd server.
[  OK  ] Started Otrd VMedia Manager Service.
         Starting OTRD KVM Server Service...
         Starting System Logging Service...
         Starting Simple Network Ma=E2=80=A6ent Protocol (SNMP) =
Daemon....
         Starting Permit User Sessions...
[  OK  ] Finished Permit User Sessions.
[  OK  ] Started Serial Getty on ttyS4.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started OTRD KVM Server Service.
[  OK  ] Started System Logging Service.
[  OK  ] Created slice Slice /system/dropbear.
[  OK  ] Started SSH Per-Connection Server (100.20.20.245:65287).
[  OK  ] Started Simple Network Man=E2=80=A6ement Protocol (SNMP) =
Daemon..
         Starting Phosphor SNMP conf Manager...
[  OK  ] Started Phosphor SNMP conf Manager.
[  OK  ] Listening on phosphor-ipmi-net@bond1.socket.
[  OK  ] Started Phosphor DBus Monitor.
         Starting BMC health monitoring...

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) nodistro.0 =
NULL ttyS4

------=_NextPart_001_0030_01DB522D.F1F65420--

------=_NextPart_000_002F_01DB522D.F1F65420
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILbzCCA5kw
ggKBoAMCAQICEBqVdRMuyKyJSi3mlhmK55EwDQYJKoZIhvcNAQELBQAwXzETMBEGCgmSJomT8ixk
ARkWA2NvbTEZMBcGCgmSJomT8ixkARkWCWllaXN5c3RlbTESMBAGCgmSJomT8ixkARkWAmFkMRkw
FwYDVQQDExBhZC1MQ1hYSk5DQTAxLUNBMB4XDTIzMDMyNDEzMzYzMFoXDTQzMDMyNDEzNDYzMFow
XzETMBEGCgmSJomT8ixkARkWA2NvbTEZMBcGCgmSJomT8ixkARkWCWllaXN5c3RlbTESMBAGCgmS
JomT8ixkARkWAmFkMRkwFwYDVQQDExBhZC1MQ1hYSk5DQTAxLUNBMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAsQtm7pm2dOmyzc1qS4mlY4X6kSas0BWjD9zFh+wFfrABvHC7vmx0t+9O
15EMbh6YiR30AEFQGffXmKw5PN8XsWOR20W372am7Z3Jnwib0YEy11LHnsoX3Ko4BcPhWD0jApir
Rks0YP5KJw74FmJ9V7nECm6fwYCPlt2VmaYEUIxV6SpwsWRvuZcpa1eGUPf84/LDHiA+hjgdz22m
sQiWN007F9oNpbjINn8WvzC/uP0GYCG9lQzj5BqZWuGFQbNJusyO0HcnI53rUV4z15nGGG4Y9UHC
IdKtE70ByXYqmeyQiFYWziWb7X03L5EEfn9pFjSMTuw+PLEJxM9I6o++wQIDAQABo1EwTzALBgNV
HQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU8IcflaHQ7/sKyg+q3UNeA/+6KTww
EAYJKwYBBAGCNxUBBAMCAQAwDQYJKoZIhvcNAQELBQADggEBAHxxbIJD0ee3yzqqaPfet3COUluC
tvmARdHnX3cuFQ9xAQ0BK7IDm4HjKlvJWni9IBm3ciPqIWvtYnLPc9teKK22y/Ji25Yq9xvK4QF/
SqmpIXI/agnzHTjBcQ9IHEuGl91uLfBwkLytphJIxlTU7NFNG50t2G3feifPRKPgyAbg+CF4yYly
b4fw3iM/0xE6+601udMErBXLy56PqL3pJa6y9cvQVq/vymJGeN6cUOToy0IcTaeSUlxu59vwe3fO
uSYog4pMPvgH1jiU0vBRpqH1la6dC4d8CLdnqVWZxZKyQxull8UkQItie78P/HjF8tkZdLflGjGZ
EOBMOmYLsVEwggfOMIIGtqADAgECAhNEAAACe8ztOr37wyuUAAAAAAJ7MA0GCSqGSIb3DQEBCwUA
MF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAXBgoJkiaJk/IsZAEZFglpZWlzeXN0ZW0xEjAQBgoJ
kiaJk/IsZAEZFgJhZDEZMBcGA1UEAxMQYWQtTENYWEpOQ0EwMS1DQTAeFw0yMzAzMzAwNzEyMjda
Fw0yODAzMjgwNzEyMjdaMIGuMRMwEQYKCZImiZPyLGQBGRYDY29tMRkwFwYKCZImiZPyLGQBGRYJ
aWVpc3lzdGVtMRIwEAYKCZImiZPyLGQBGRYCYWQxMzAxBgNVBAsMKua1qua9rueUteWtkOS/oeaB
r+S6p+S4muiCoeS7veaciemZkOWFrOWPuDEPMA0GA1UEAwwG6IyD55uKMSIwIAYJKoZIhvcNAQkB
FhNmYW55aUBpZWlzeXN0ZW0uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsiMn
E0t7kyL3vqVkcclJYsnmvCmE5X+CI5L0zdE4g9kpn+JDleGCkBOJudz11iKsvd2O6gaMTKPGoYVS
ONHxAgDt+IOvVrX10nHupCbkt2EyjQOgKtub7NdA42OoEJ9qtjtetVYFy5053xWE0cO2f6SqzKa8
rIrGTK0vliHtUEZbZ/Q1/ZnCjZd/kgl0QGiQcnqXlm/f6cfymy2kxu5UW4XhNanwkLxpCQNcuBTx
+lziagX4S+pnoFqMS6+CW70CYm8+5aDDKPA4ySHa4W/tBeVtgjBMV3rfejrvC0el6RUeRPWfmGeX
F2Bl1lRXxad8qn0GauBLk4SgJpD8tZFLuQIDAQABo4IEMTCCBC0wDgYDVR0PAQH/BAQDAgWgMD0G
CSsGAQQBgjcVBwQwMC4GJisGAQQBgjcVCIW47TGHoewUhe2REYSOyzSE4PgcTILEnXSDhYAcAgFk
AgEIMEQGCSqGSIb3DQEJDwQ3MDUwDgYIKoZIhvcNAwICAgCAMA4GCCqGSIb3DQMEAgIAgDAHBgUr
DgMCBzAKBggqhkiG9w0DBzAdBgNVHQ4EFgQUxgT+F631hn3ZmnE1Qt2XV15C9j8wHwYDVR0jBBgw
FoAU8IcflaHQ7/sKyg+q3UNeA/+6KTwwggEiBgNVHR8EggEZMIIBFTCCARGgggENoIIBCYaBwmxk
YXA6Ly8vQ049YWQtTENYWEpOQ0EwMS1DQSxDTj1MQ1hYSk5DQTAxLENOPUNEUCxDTj1QdWJsaWMl
MjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWFkLERDPWll
aXN5c3RlbSxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hkJodHRwOi8vTENYWEpOQ0EwMS5hZC5pZWlzeXN0ZW0uY29t
L0NlcnRFbnJvbGwvYWQtTENYWEpOQ0EwMS1DQS5jcmwwggE4BggrBgEFBQcBAQSCASowggEmMIG3
BggrBgEFBQcwAoaBqmxkYXA6Ly8vQ049YWQtTENYWEpOQ0EwMS1DQSxDTj1BSUEsQ049UHVibGlj
JTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1hZCxEQz1p
ZWlzeXN0ZW0sREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0
aW9uQXV0aG9yaXR5MGoGCCsGAQUFBzAChl5odHRwOi8vTENYWEpOQ0EwMS5hZC5pZWlzeXN0ZW0u
Y29tL0NlcnRFbnJvbGwvTENYWEpOQ0EwMS5hZC5pZWlzeXN0ZW0uY29tX2FkLUxDWFhKTkNBMDEt
Q0EuY3J0MCkGA1UdJQQiMCAGCisGAQQBgjcKAwQGCCsGAQUFBwMEBggrBgEFBQcDAjA1BgkrBgEE
AYI3FQoEKDAmMAwGCisGAQQBgjcKAwQwCgYIKwYBBQUHAwQwCgYIKwYBBQUHAwIwQwYDVR0RBDww
OqAjBgorBgEEAYI3FAIDoBUME2ZhbnlpQGllaXN5c3RlbS5jb22BE2ZhbnlpQGllaXN5c3RlbS5j
b20wTQYJKwYBBAGCNxkCBEAwPqA8BgorBgEEAYI3GQIBoC4ELFMtMS01LTIxLTE1MjM2ODQ3MDkt
NDU5MDQzMDU3LTg0MTgwODU3OS0zMTQ5MA0GCSqGSIb3DQEBCwUAA4IBAQBr0yu7S4f90/Scjv3s
SChUweCbhrTDn00n0FJB4DweuD6G5K7xiYCF8y0OfiezfJmixKE/PpkgGvx+Zt4JHcXkX+rOUssg
aaVv1T7pDW3aCpZAld5lTHYnoGA7uULzeRByG9pO7plmQO0kZd8WE+FUYFk9gFzHwQ7eaxvpHDEh
SIO3cvLyqm3euCTrnWkwYXU6rTZi5wPl+FJrQsSPgxnx2omo5K6igg4AWJ1dsRNx42rJVvXfh/cx
WMU6eTNvBynOA+GqfmYDZQrX9r2Ook5JvV/VIn+vTsp7Cyz2y321gA1LyFpGdlk9O5TVcoGId9cg
OpZDOkwCn0F42aFxo+qMMYIDYjCCA14CAQEwdjBfMRMwEQYKCZImiZPyLGQBGRYDY29tMRkwFwYK
CZImiZPyLGQBGRYJaWVpc3lzdGVtMRIwEAYKCZImiZPyLGQBGRYCYWQxGTAXBgNVBAMTEGFkLUxD
WFhKTkNBMDEtQ0ECE0QAAAJ7zO06vfvDK5QAAAAAAnswCQYFKw4DAhoFAKCCAcEwGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQxMjE5MDc1MjAyWjAjBgkqhkiG9w0B
CQQxFgQUh1QbraOsEiZzCSOnwVpqDySjT5wwUAYJKoZIhvcNAQkPMUMwQTAKBggqhkiG9w0DBzAO
BggqhkiG9w0DAgICAIAwCwYJYIZIAWUCAQEEMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMIGFBgkr
BgEEAYI3EAQxeDB2MF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAXBgoJkiaJk/IsZAEZFglpZWlz
eXN0ZW0xEjAQBgoJkiaJk/IsZAEZFgJhZDEZMBcGA1UEAxMQYWQtTENYWEpOQ0EwMS1DQQITRAAA
AnvM7Tq9+8MrlAAAAAACezCBhwYLKoZIhvcNAQkQAgsxeKB2MF8xEzARBgoJkiaJk/IsZAEZFgNj
b20xGTAXBgoJkiaJk/IsZAEZFglpZWlzeXN0ZW0xEjAQBgoJkiaJk/IsZAEZFgJhZDEZMBcGA1UE
AxMQYWQtTENYWEpOQ0EwMS1DQQITRAAAAnvM7Tq9+8MrlAAAAAACezANBgkqhkiG9w0BAQEFAASC
AQAwHY9VA/9ZKEgeyZuGuwdRaWLcTyPB93FGQgjNawCSWgJPe4nZtKfalMVMT+8McoV4AJ38APu2
+8x8bWOFKNIIipnJgbYO1L27EKz3FOOHtUlVh0NTLFgypDqP9D26xsgWIEnpF8pOsj6qcOaeAxdR
wAOTLx32j31kpu/9Sa1IFH4GUEwradKrom2ZLoEdualPY8xV0TpUJK9B/OvUcoM5yQAxJPf5pkKA
iT2CNtpc4JDp0Y+w8IUDmNj0uefbMIaQmz292Y1h0gXFUQC+u1pDo6LtbHLYqPw1z14KX07w7gJ9
ujRM6TMFDT7Kje4H64ROniX9Yq9jyCU0FzKG3LdWAAAAAAAA

------=_NextPart_000_002F_01DB522D.F1F65420--
