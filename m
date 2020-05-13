Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F961D0371
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 02:18:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MFdf21GfzDqkj
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 10:18:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=F8TG52ZX; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=F8TG52ZX; 
 dkim-atps=neutral
X-Greylist: delayed 92 seconds by postgrey-1.36 at bilbo;
 Wed, 13 May 2020 10:18:06 AEST
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MFct1NsQzDqMk
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 10:18:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1589329082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=7W7uIojtH8vI5M/89U1WOETJxDuHeHE1BIG3Lbw9KgQ=;
 b=F8TG52ZXrbZtwkc/66eTutFo62QPNH+NqUeIm9nXZilhTceUjbCi4BG1UQbCQ8bSZEK9ZK
 8vr3ntVMzyLV9SmfE/VobMJ8W4wjUaC0eLaRP+XbbCPj+NDcxs0dcZhTcNeiySu4jFQbez
 8Y2POdNbd8wqF/WDjPgIyJz2kwMo0RQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1589329082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=7W7uIojtH8vI5M/89U1WOETJxDuHeHE1BIG3Lbw9KgQ=;
 b=F8TG52ZXrbZtwkc/66eTutFo62QPNH+NqUeIm9nXZilhTceUjbCi4BG1UQbCQ8bSZEK9ZK
 8vr3ntVMzyLV9SmfE/VobMJ8W4wjUaC0eLaRP+XbbCPj+NDcxs0dcZhTcNeiySu4jFQbez
 8Y2POdNbd8wqF/WDjPgIyJz2kwMo0RQ=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-Bq6xw1krNYSpLV_hsSrUAw-1; Tue, 12 May 2020 20:16:24 -0400
X-MC-Unique: Bq6xw1krNYSpLV_hsSrUAw-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 12 May 2020 17:16:22 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 12 May 2020 17:16:22 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: phosphor-ipmi-flash interfaces
Thread-Topic: phosphor-ipmi-flash interfaces
Thread-Index: AdYot2r4k1N2F+XPTC+e6VW9k+WH7QAA/F1g
Date: Wed, 13 May 2020 00:16:21 +0000
Message-ID: <d5f9ec4e5c554c2b9588cb7ba2bec581@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_d5f9ec4e5c554c2b9588cb7ba2bec581SCLEXCHMB13phoenixcom_"
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

--_000_d5f9ec4e5c554c2b9588cb7ba2bec581SCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I got a "ipmibt" interface transfer complete and want to move on to one of =
the faster interfaces to speed up debug since it takes so long to transfer =
the FW image.

For the "ipmilpc" and "ipmipci" interfaces, do those options require ASPEED=
_LPC_CTRL and ASPEED_P2A_CTRL respectively in the BMC's kernel config?  Tho=
se two configs happen to be disabled in the BMC I'm building and I've been =
searching for examples on how to configure the memory regions correctly bot=
h on the BMC and the host side and am not entirely sure what I'm looking fo=
r.


--_000_d5f9ec4e5c554c2b9588cb7ba2bec581SCLEXCHMB13phoenixcom_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
span.EmailStyle18
=09{mso-style-type:personal-reply;
=09font-family:"Calibri","sans-serif";
=09color:#1F497D;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I got a &quot;ipmibt&q=
uot; interface transfer complete and want to move on to one of the faster i=
nterfaces to speed up debug since it takes so long to transfer the FW image=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">For the &quot;ipmilpc&=
quot; and &quot;ipmipci&quot; interfaces, do those options require ASPEED_L=
PC_CTRL and ASPEED_P2A_CTRL respectively in the BMC's kernel config?&nbsp; =
Those two configs happen to be disabled in the BMC I'm building
 and I've been searching for examples on how to configure the memory region=
s correctly both on the BMC and the host side and am not entirely sure what=
 I'm looking for.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
</div>
</body>
</html>

--_000_d5f9ec4e5c554c2b9588cb7ba2bec581SCLEXCHMB13phoenixcom_--

