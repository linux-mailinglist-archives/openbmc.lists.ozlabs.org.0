Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02F6223FA
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 07:30:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6ZpN4xP0z3byZ
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 17:30:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=KcYDfKxz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=121.242.48.116; helo=inblrg02.tcs.com; envelope-from=prvs=305b75172=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=KcYDfKxz;
	dkim-atps=neutral
X-Greylist: delayed 72 seconds by postgrey-1.36 at boromir; Wed, 09 Nov 2022 17:29:46 AEDT
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Znk4PQFz2xGn
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 17:29:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1667975387; x=1699511387;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=GAYkmkyb6avM1H4nGIA9PzfEDmMGfuxLGv1zxyifgic=;
  b=KcYDfKxzO39j9wbvsFXfXtwS2t6sZyb07NMI2gctkdJu7l0IVCoYNeMl
   0Vs8IuVxm3gjAVnb2wxj3COc8Aqc6VBXsTwLGroXNcs8g6Arq2GbpQ+LK
   LwBdlqdj/OfHL/lY7u9Q8Qr9xhNVlwmGRlCcRBx7V4FiOhkwlZdnkvTAF
   D9+bF504fA2uejXuzg55bFjXmiZXa1vkmyBlt1FCv5Q2SR15xTvrhoGj0
   7ZFWtwyCpQ8Hc/3NkkVFnIealCNeC9J5kY1NYMYz9XbKgAwYWJt7qng9B
   UcexlXi5bcVnk+/8/87CTpdfPuaHGsmQ0BNZg2kkYrTjZ/BPn4IQdXM4a
   A==;
X-IronPort-AV: E=Sophos;i="5.96,149,1665426600"; 
   d="scan'208,217";a="130248390"
X-DISCLAIMER: FALSE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cekcJ9FhcpEbz6yxx0xEyR1SEKGKY4I+KAdtCPfOfHh0wWmtq3ux9fGuMaNIE6TdeMGBz+psP5nSYVvkFuKS40OQrMmOewCyg/YpvaEGNNTLWH9Xpox79AUbczQ89iWf3inVSKmXQsJXMbvTQ+fZvbkGQ+vh1Ha9AcZWa/o5x9dhbxZkonRZnph8v6K2sRArtxmj2T82qtclf1T004IWVchcjRDFhzu/hwc32O1ZEy08lDGU1zhshfRHToSUdJakxv9Zn4h+5DQ9PSHBCSyz9LYE1ReF02k0W/z5KdisiHSLJMQzAVhqa9TUKCDlFQNZodYev1bEZfIfV6fG1bLDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAYkmkyb6avM1H4nGIA9PzfEDmMGfuxLGv1zxyifgic=;
 b=BlsIXKgllB2nEgmOv3yauWKWBDo564iuCkDUjtm9jVnhv891LSkmELuO8Z8KWPUs3ZQNg3FmR1an+fslo/o36xnyBUd4kAZjQnwzG52VNBysFJelH+FGz/QtAMviyeBb2Ycm5DJCqI+OV/Flsn87DX/Nj19po5ygI8zFPq4If63A1iJpthpEFey24vw/foy+44PY84GoHcKhVR2S5pcjnOQxZkwlPvd/bnmVbAny6Q/6ne1lyzTdI3G9iVTnB/fOvG+J4L6fI9+J9sMKsYGRvR9B2C9ggcfDsbQqRnZ9MAyN5/IbPEEZdLriVabpv5lFkegj+bq4vLZs2yoCXT+MnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: Sandeep Kumar <sandeep.pkumar@tcs.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: OpenBmc contribution
Thread-Topic: OpenBmc contribution
Thread-Index: AdjzZ2DKboFkgVuORM+0XUP0p9nbFQAnPHyA
Date: Wed, 9 Nov 2022 06:28:01 +0000
Message-ID: <MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB4129305D091FE3210BA8A26F873F9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB4129305D091FE3210BA8A26F873F9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2022-11-09T06:28:00Z;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=a81a881d-a3dc-4632-b056-3d6a60d9a790;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PNZPR01MB4141:EE_
x-ms-office365-filtering-correlation-id: 121b3e6f-4220-4bcb-2e26-08dac21b8d51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iNhfd0VBPCbBvcvdTV6k/H+czPmDkFKsQ0nAPecheu/2fsoI98GpUOC8zYpmc2M35NNYKw6BlNT3Db9NsExpmqm0y6EmHg8c2Z84lsTlkxsTbiX37ri/XiNefENHNuErawNRKMGPsVsan13jd7aT+JAW/rQeut5qjH5d+8PpWxGY240OSQAUOTfY16maa95lXVErQm39320+FwbfhNyncsJZOfyXf+LYDg7bOybnGMKs4BxpzksVrtgVL0jB7skh/PfB4cQKQAQnb52Vgibzisc7CjbPlY1ISKULQFqx+yCnfO7yj1oo+8/tyyT2+NccWrvAuGU8Tmsqts3Y+5sxS234DAtmo23rCCKXL1RpoCg5guZTn7OjpROTZTiD1BWtyaZGocr/ULW6hBBloTVy0O811q2mAz52SSKTkHjsYi/L8+bVdBCL0XSHC9LCZBGO5uUItzHRra5J0LaJD1j7QjeksrB7MAb2f+RINaxN97REKMgt38Y3Vg0hUdW8Cyz5sEPgYHlyzYIRPKGJmL7s9ZRudikTTh3/vbXVi6IXyg/SYnr/1tDRnPFF1KivhAMnbGlbFi4+ew+bTrTOwTxxNH+uqF6JkUR9KvIADFJuym5fspyxe6rTklnK9pD0rgWRSqMrOMG+2Oz+6OZbFUPJ/EqZB64hg3YL9pceQn9beU/LsJg4pYGzST7beiYpV7UGFGP8oDvseNnkE0Du6SgxsCZcPlEeewtpiTDhH1JF+Wk3siopPo1kKmNbpKHIuzL2cwbHk5SxFaLbMeACV0h2PA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(26005)(83380400001)(9686003)(6506007)(53546011)(7696005)(38100700002)(82960400001)(122000001)(186003)(5660300002)(4744005)(3480700007)(2906002)(55016003)(41300700001)(71200400001)(7116003)(478600001)(8936002)(110136005)(8676002)(76116006)(316002)(66946007)(64756008)(66446008)(66556008)(52536014)(66476007)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kzn8ldoBpPw6jmkUh4RX7kglaEBJpNejWBpXjUpJShdcfEWVd2q+KPlOFap+?=
 =?us-ascii?Q?zkmM8cYMpeoDdO19ZWcJYrIo8gzyDE38JrBB/P1HDH8hw96WjzgmMICJiMBu?=
 =?us-ascii?Q?sFFeabVVEIkIjV1t6AU/3pdPQt4yZBoVFFSjwlaAYOWneAdKtP9HuS58RDEt?=
 =?us-ascii?Q?1+1eykLR+3xazP9YSBYZskz9Gf9jIyHPplSynjLkyIfk+S5S4cIHT4xXl0MF?=
 =?us-ascii?Q?6Guq1wR7lL2Ypq27uzl5DHUO3L8TE7vu1/q82+wgjDzgFdxUbrd0piWWOFV9?=
 =?us-ascii?Q?TiI6GVUrwxMP+5mTLLcCYqmx3ni8DCmQWGbgC2HsJvS9G4oEQ7C2AKQJjD6j?=
 =?us-ascii?Q?SF+ILjfMYWdF8MHajjQWNDsZGVCr2tkpC0BOWHX4iGrC8nCwG+ppdgnl7uc9?=
 =?us-ascii?Q?teIgNJUewMATozBWq+3QXGsDLSNT20Mkxh+DDurAYPIxAeJ73PdOK6KDibvF?=
 =?us-ascii?Q?ymKKlRbWFWouJV7c67EuonGDC/URRQbCgnmWgb2OfTdWydmJgDVYai7JECfI?=
 =?us-ascii?Q?W9cxQYI5V2CyjLJ7NPskx7NuQyl8xJ3ZcnJTXq97lap+b8/Iu7f0S+71oj/Z?=
 =?us-ascii?Q?ZoFFwNrhxHiG0/rZ+jFYvyjVaQQw+SDXfsPJx6nhcvBtg2Y5unlXz3yUnWqr?=
 =?us-ascii?Q?clBMWKl0paCn0nhA9Go0tgHyUMJBQwdQh6psYbk6dFEFGW+KA7AYcT1gzrE9?=
 =?us-ascii?Q?L3RpR+EEnWhey76mdfn9COGbI13I0rOFMZghSMQi9Ao2FHC8VDiyuvhi06O6?=
 =?us-ascii?Q?Be6eBwTDAjxyTdFoYOGwIlpQj4aK+ofY98IwwhV9SRj3Ti82LaZC7GWhHuL6?=
 =?us-ascii?Q?cDKLKMNlbdS/idS+9FH0A5ClmZsC0M4eGCpBEL5nRXs2iUO4QwD1uKnwGTtL?=
 =?us-ascii?Q?53ELStUCocz9RfSQSY4HRlB0/FNzJ/199Dw0qyHYE7OCbB32G0NorO89ur5X?=
 =?us-ascii?Q?wBRjNb/N6nuwr7Bxr+sE+/NwJLRwIW5BWfnmaLuBsS53rDIqQKAymB/n1Gfr?=
 =?us-ascii?Q?VHB1zbSMmfa2uPMG9QtaCc0o01ZGys/PrIt10ZJnNZbr2It+pvuQyPXl7qH1?=
 =?us-ascii?Q?RjQlJHRqSrcPZiYexSwAxY+cFXjf/7X+BjgFnqoSy1DiHH9a9VbauXYZDCm1?=
 =?us-ascii?Q?wqjZH0xenNrefHhotjURGy4uhl/liSdQRck9YcqS3BqmvBvWR0pdzqVPuuXw?=
 =?us-ascii?Q?92zR+ibEHAqfy8D1VPOyOHKSQq+C74+xaj0cy/JNdbNn7ezOAP5ba7wS9elK?=
 =?us-ascii?Q?6kNBOUWLUAxjr2xmFAJi1Mg+f08AC/FFUncC8tAzdRgouQgw9dpT8qkDDZOY?=
 =?us-ascii?Q?COc2z+kCP4MV3344CpLph4cnUhYwiI3t5oraxJUHsqsc+HQVBbFcYdxtiK2g?=
 =?us-ascii?Q?qgWi1w96HxfHEOUkAJ6XXbNIdw5xEclrldVcCpkFkNqKqz1imVVMW7SXsNDR?=
 =?us-ascii?Q?n/3Dx9uFFtMvaDvMEupl/2m8EFgpOzmgEJNloUxDNeMew1APncggSA7Tq3+L?=
 =?us-ascii?Q?zoGDTJiqd7mXS8up67sJc0qrmm4B6zs49bq/nxrkhyLB1WKixsYTycLfK3Oo?=
 =?us-ascii?Q?tczTzpZnoyI4NTpetyM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 121b3e6f-4220-4bcb-2e26-08dac21b8d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:28:01.7003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bytjZ8N+mWh09xeDQQvpO2v5mvuRD5ojWgqxN/XqNAhUft+bK2KarZD5188V8DPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4141
X-TM-AS-Product-Ver: SMEX-14.0.0.3031-9.0.1002-27252.004
X-TM-AS-Result: No-10--23.569500-8.000000
X-TMASE-MatchedRID: xcONGPdDH5ooYl6g7FoK+Y61Z+HJnvsOfrTt+hmA5bIV7J/IpF+hrRQy
	+Gzi/Qd+EoEzw0Rp53VKxa9hVWcW931QgDXtZU5Ot2Xki9xRRxO061diBteN1xxZqWTLzZ9W21x
	MY5vX91DuNQDtj0/CtAx8udxs/RmWAlb6OR37f+4BGmsibWGTbcGU90j67tDodDwP5ItpCOzesT
	w6jtmPrkkk6yagWKEs54mbosKUuYc5jS4V09dQzvx0ykrbAxjCXef5t6q8RcxKmuk8ocl7zzgo8
	pDHL4T+C8E8ZCgtbqUNajX+8EXzxT4pt4Z7puj9RynTwl9ZYh5U4sxFq6igEXYoMTAHGn1ahQH+
	YspUfFoYmbFYWrixJ9kECb6eFouAavaCW5zqiNqzRPQ8T4oe5VXHUKDXl6KwDpnuR5eZKJYik4n
	eTJndWbuwuIYnhcFSfyYDewMOrQDcVhfTSdJcuOJGF26G8SWy8lP6F/raTZg+3cueg060kN/uPP
	XO35ciUE+A/MWA8XkLWPDlP5b6h5PXwMe86I8CS4W/MRhJ1X4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--23.569500-8.000000
X-TMASE-Version: SMEX-14.0.0.3031-9.0.1002-27252.004
X-TM-SNTS-SMTP: E00C7C12B087521E6B0B77918358BE3C91A5A9B161218506718043E3A525F2582000:8
X-OriginatorOrg: TCS.COM
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

--_000_MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hi,

Any input on the below query?

Thanks,
Sandeep.



TCS Confidential
From: openbmc <openbmc-bounces+sandeep.pkumar=3Dtcs.com@lists.ozlabs.org> O=
n Behalf Of Sandeep Kumar
Sent: Tuesday, November 8, 2022 5:30 PM
To: openbmc@lists.ozlabs.org
Subject: OpenBmc contribution

"External email. Open with Caution"

TCS Confidential

Hi All,

Is it okay to submit our changes with testing done on a qemu?

Thanks,
Sandeep.


TCS Confidential

=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain
confidential or privileged information. If you are
not the intended recipient, any dissemination, use,
review, distribution, printing or copying of the
information contained in this e-mail message
and/or attachments to it are strictly prohibited. If
you have received this communication in error,
please notify us by reply e-mail or telephone and
immediately and permanently delete the message
and any attachments. Thank you

--_000_MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9MA1PR01MB4129INDP_
Content-Type: text/html; charset="us-ascii"
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
h5
	{mso-style-priority:9;
	mso-style-link:"Heading 5 Char";
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
span.Heading5Char
	{mso-style-name:"Heading 5 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 5";
	font-family:"Calibri Light",sans-serif;
	color:#2F5496;}
p.msipheaderd4f7db42, li.msipheaderd4f7db42, div.msipheaderd4f7db42
	{mso-style-name:msipheaderd4f7db42;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msipfooterd6682aa3, li.msipfooterd6682aa3, div.msipfooterd6682aa3
	{mso-style-name:msipfooterd6682aa3;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"msipheaderd4f7db42" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;color:black">TCS Confidential</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any input on the below query?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"msipfooterd6682aa3" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;color:black">TCS Confidential</span><o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+sandeep.pku=
mar=3Dtcs.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Sandeep Kumar<br>
<b>Sent:</b> Tuesday, November 8, 2022 5:30 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> OpenBmc contribution<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<h5><span style=3D"font-size:10.5pt;color:tomato;font-weight:normal">&quot;=
External email. Open with Caution&quot;</span><o:p></o:p></h5>
<p class=3D"msipheaderd4f7db42" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;color:black">TCS Confidential</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it okay to submit our changes with testing done o=
n a qemu?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"msipfooterd6682aa3" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;color:black">TCS Confidential</span><o:p></o:p></p>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you<o:p></o:p></p>
</div>
</body>
</html>

--_000_MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9MA1PR01MB4129INDP_--
