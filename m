Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A331C60D
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 05:45:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfpLK2qD2z30QD
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 15:45:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=pravinashj@ami.com; receiver=<UNKNOWN>)
X-Greylist: delayed 902 seconds by postgrey-1.36 at boromir;
 Tue, 16 Feb 2021 15:45:00 AEDT
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfpL46bCnz30HP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 15:45:00 +1100 (AEDT)
X-AuditID: ac10606f-231ff70000001934-9f-602b4a41d529
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 A7.C5.06452.14A4B206; Mon, 15 Feb 2021 23:29:53 -0500 (EST)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0468.000; Mon, 15 Feb 2021 23:29:53 -0500
From: Pravinash Jeyapaul <pravinashj@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: U-boot version for AST2500
Thread-Topic: U-boot version for AST2500
Thread-Index: AdcEG/zP5ojvQ8TiTuKM8T5r3WubXQ==
Date: Tue, 16 Feb 2021 04:29:52 +0000
Message-ID: <172B3E99B822FF48BA79AD354B1F1F59027BE00DC6@atlms1.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.4]
Content-Type: multipart/alternative;
 boundary="_000_172B3E99B822FF48BA79AD354B1F1F59027BE00DC6atlms1usmegat_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsWyRiBhhq6jl3aCQeNyLYtTLS9YHBg9zs9Y
 yBjAGNXAaJOYl5dfkliSqpCSWpxsqxRQlFmWmFyppJCZYqtkqKRQkJOYnJqbmldiq5RYUJCa
 l6Jkx6WAAWyAyjLzFFLzkvNTMvPSbZU8g/11LSxMLXUNlexCMlIVMvPS8otyE0sy8/MUkvPz
 SoCqU1OAogoJ3ZwZW/69Yys4LVTx9MAklgbGvQJdjJwcEgImEp8+v2XqYuTiEBLYxSRx5McN
 ZgjnMKPExdX7mUCq2AR0JV5PbWEGsUUELCWWPGhnA7GFBZQlemYeZ+1i5ACKa0hsW5sBUaIn
 0fCpiw0kzCKgKrF4bwxImFcgUGLjwbvsIDajgJjE91NrwKYzC4hL3HoynwniHgGJJXvOM0PY
 ohIvH/9jhbAVJDas/cAOUZ8vsWzKZ3aImYISJ2c+YZnAKDgLyahZSMpmISmDiOtILNj9iQ3C
 1pZYtvA1M4x95sBjJmTxBYzsqxiFEktychMzc9LLjfQSczP1kvNzNzFCYjx/B+PHj+aHGJk4
 GA8xSnAwK4nwsn/WShDiTUmsrEotyo8vKs1JLT7E6AQMh4nMUtygOAFGcryxgYGUKIxjaGJm
 Ym5kbmhpYm5srCTOu8r9aLyQQDowsWSnphakFsEMYeLglGpgXH/Lx65p91XD8N7A09dWpugl
 GzuLnmXRns3y9b5QklgIi/b8y/f0st4ovJ5bfCFXOezS7ZoPsbqn6kLKD19ILBC41SEQmaS0
 lu2T+8XjcTdmV7Ad8v8VE/hiq+rk/tvlrPoneqftkiicGbdP44i8eTCDmZ1D740rmntSyyf/
 FvH+tfFE8cmNSizFGYmGWsxFxYkAao3b9gYDAAA=
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

--_000_172B3E99B822FF48BA79AD354B1F1F59027BE00DC6atlms1usmegat_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there any specific reason for using v2016.07 u-boot for AST2500? Why don'=
t community use v2019.04 for both AST2500 and AST2600.

Regards,
Pravinash


Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends (AMI).  This communication is intended to be read o=
nly by the individual or entity to whom it is addressed or by their designee=
. If the reader of this message is not the intended recipient, you are on no=
tice that any distribution of this message, in any form, is strictly prohibi=
ted.  Please promptly notify the sender by reply e-mail or by telephone at 7=
70-246-8600, and then delete or destroy all copies of the transmission.

--_000_172B3E99B822FF48BA79AD354B1F1F59027BE00DC6atlms1usmegat_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micro=
soft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" xm=
lns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://w=
ww.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Is there any specific reason for using v2016.07 u-boo=
t for AST2500? Why don&#8217;t community use v2019.04 for both AST2500 and A=
ST2600.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Pravinash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<!-- --><font color=3D"#009900" face=3D"Webdings" size=3D"4">P</font><font
  color=3D"#009900" face=3D"verdana,arial,helvetica" size=3D"2"> <strong>Ple=
ase
consider the environment before printing this email</strong></font>
<!-- --><p>The information contained in this message may be confidential and=
 proprietary to American Megatrends (AMI).  This communication is intended t=
o be read only by the individual or entity to whom it is addressed or by the=
ir designee. If the reader of this message is not the intended recipient, yo=
u are on notice that any distribution of this message, in any form, is stric=
tly prohibited.  Please promptly notify the sender by reply e-mail or by tel=
ephone at 770-246-8600, and then delete or destroy all copies of the transmi=
ssion.</p>
</body>
</html>

--_000_172B3E99B822FF48BA79AD354B1F1F59027BE00DC6atlms1usmegat_--
