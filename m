Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C024E59C
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 07:39:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYRys1YGGzDrKL
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 15:39:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=neil_bradley@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=skcQIHEG; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=skcQIHEG; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYRy460qJzDrJ5
 for <openbmc@lists.ozlabs.org>; Sat, 22 Aug 2020 15:38:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598074710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=wMhOrBDHf7bjN/PXkwUUG4fRqLnuoWoNTpaNKqLbqd4=;
 b=skcQIHEGRl+m+ThSL3j+VZzQKgtEG7CL5oRLIrciYlmLNhIG/KKVgDlhZQz2HCCi0qpOI8
 eLFesUq82ATUU7MJW6B0e1rKits5ppnTE7WP+xky1ZE9scmHlnxtNwFUJWGHxDcNkVg94u
 3Q1w8X73XtOfITC7AGsn6qK65qisqX8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598074710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=wMhOrBDHf7bjN/PXkwUUG4fRqLnuoWoNTpaNKqLbqd4=;
 b=skcQIHEGRl+m+ThSL3j+VZzQKgtEG7CL5oRLIrciYlmLNhIG/KKVgDlhZQz2HCCi0qpOI8
 eLFesUq82ATUU7MJW6B0e1rKits5ppnTE7WP+xky1ZE9scmHlnxtNwFUJWGHxDcNkVg94u
 3Q1w8X73XtOfITC7AGsn6qK65qisqX8=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-P_iLcu0VPpy8y0GotLOwaQ-1; Fri, 21 Aug 2020 21:36:27 -0400
X-MC-Unique: P_iLcu0VPpy8y0GotLOwaQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 21 Aug 2020 18:36:24 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 21 Aug 2020 18:36:24 -0700
From: Neil Bradley <Neil_Bradley@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQ==
Date: Sat, 22 Aug 2020 01:36:23 +0000
Message-ID: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.171]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=neil_bradley@phoenix.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_c27c916296c14b7a973ce10ce462a574SCLEXCHMB13phoenixcom_"
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_c27c916296c14b7a973ce10ce462a574SCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Greetings fellow BMC folk - I'm Neil Bradley, Phoenix Technologies' BMC arc=
hitect and have a question for the group.

We are attempting to load OpenBMC 2.8 on a Tioga Pass. This is what we did:

mkdir tiogapass
cd tiogapass
git clone https://github.com/openbmc/openbmc.git
cd openbmc
git checkout 35a774200999ac2fca48693c1c169bf99d2f63ea
export TEMPLATECONF=3Dmeta-facebook/meta-tiogapass/conf
source openbmc-env
bitbake obmc-phosphor-image

The BMC does boot fully, however there are two major problems we've encount=
ered:


  1.  Host will not power on via the front panel power button
  2.  BMC Will not obtain or try DHCP even though its set enabled for the p=
rimary LAN channel

I have a couple of questions:


  1.  Was this built/done correctly? In other words, did I do something wro=
ng in this process?
  2.  Does anyone know the current state of Tioga Pass support in 2.8 or th=
e general health therein?

We're coming up to speed on this quickly, so apologies if these are stupid =
questions. And greetings!

-->Neil

--_000_c27c916296c14b7a973ce10ce462a574SCLEXCHMB13phoenixcom_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
=09{mso-style-priority:34;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:0in;
=09margin-left:.5in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
/* List Definitions */
@list l0
=09{mso-list-id:740754711;
=09mso-list-type:hybrid;
=09mso-list-template-ids:2034938212 67698705 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
=09{mso-level-text:"%1\)";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level2
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level3
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l0:level4
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level5
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level6
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l0:level7
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level8
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level9
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1
=09{mso-list-id:1706324325;
=09mso-list-type:hybrid;
=09mso-list-template-ids:175695922 67698705 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l1:level1
=09{mso-level-text:"%1\)";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level2
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level3
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1:level4
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level5
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level6
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1:level7
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level8
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level9
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
ol
=09{margin-bottom:0in;}
ul
=09{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Greetings fellow BMC folk &#8211; I&#8217;m Neil Bra=
dley, Phoenix Technologies&#8217; BMC architect and have a question for the=
 group.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are attempting to load OpenBMC 2.8 on a Tioga Pas=
s. This is what we did:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">mkdir tiogapass<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">cd tiogapass<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">git clone
<a href=3D"https://github.com/openbmc/openbmc.git">https://github.com/openb=
mc/openbmc.git</a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">cd openbmc<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">git checkout 35a774200999ac2fca48693c1c169bf99d2f=
63ea<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">export TEMPLATECONF=3Dmeta-facebook/meta-tiogapas=
s/conf<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">source openbmc-env<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas;color:#1F497D">bitbake obmc-phosphor-image<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The BMC does boot fully, however there are two major=
 problems we&#8217;ve encountered:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Host will not power on via the front panel power button<o:p></o:p></l=
i><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level=
1 lfo1">BMC Will not obtain or try DHCP even though its set enabled for the=
 primary LAN channel<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have a couple of questions:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2">Was this built/done correctly? In other words, did I do something wro=
ng in this process?<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"=
margin-left:0in;mso-list:l1 level1 lfo2">Does anyone know the current state=
 of Tioga Pass support in 2.8 or the general health therein?<o:p></o:p></li=
></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We&#8217;re coming up to speed on this quickly, so a=
pologies if these are stupid questions. And greetings!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Wingdings">&agrave;</span=
>Neil<o:p></o:p></p>
</div>
</body>
</html>

--_000_c27c916296c14b7a973ce10ce462a574SCLEXCHMB13phoenixcom_--

