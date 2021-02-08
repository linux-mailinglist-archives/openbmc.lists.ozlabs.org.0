Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C631432E
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:49:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZLn54bpkzDvXR
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 09:49:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.134;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=E2wVfJyo; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2134.outbound.protection.outlook.com [40.107.223.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZLmJ6B5GzDvVl
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 09:48:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRJo4Liu4rG7GHMqVQ6z89akyU20CnCNa+OEWLNqXoLHwAfKuidsyCi3SVQvPlIUEgdMIDFArfwWu4/W/Ehf7DiBC4+QTAxrPKSDJmDv183PlgMham6vYdrDS6A0JQy/EH0BqVvaiPVsuH9LYQlI006g35KwtndJHexG0TuTOnAfGbx4divYPxH7qYMnTQlUtXBvjNKTmKoRPYTqSQWAnWD02MIXShkzvgUqBMI7qGgz8Ifisl+mIMvERj6pZEyb2QmgtcPbiz8yoc2UkGkdfw3F/ea3SdSGrP0mcz+C8Glws9z1qMPtzoSHJMqSn3Pn4LXRQWoT5s3faMP5S8pZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieeVSWbL8xxburbVLWLeAQ/1x681UFCAB4m5kl8JFbM=;
 b=cQElCC1PdHcVCZNnf6lb+aXL9LLDUYNU+y5UB8Plk688s/JdbgGNCC6qWtEkJGGfuz47gZBe1Lz6CGlYjV6OtLWN8KIEaHziM7dLuG+yvOfIdrqk6cjacq6rTXjYu5oZIpciPsWfrdohNw2xcAEzXfeE4hQ13QHJ3bEZKwUzxyYPrcS3Jgw4cXhmqgV2p7cKwGKzAESTftTuphlAMN19kN45dF83LHRhA8VEHuhp1uKEi5IL99wcLb6RqwM9z9ZTDptMd3p4CucUNDFgin1fskuGqT1+tlK6+2jHcghBdTmeX00lUcrRw7l7+ci2KJPU2Fs3GKjQYsRosa8aVv8jAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieeVSWbL8xxburbVLWLeAQ/1x681UFCAB4m5kl8JFbM=;
 b=E2wVfJyokF2O2ouERIFH06jlZ1Kr/fRVGU7XLB1m3TRRbtRdxX776dmyxXIQN3AgH5OEsUZyT6/QgP9g05br7cYpOIiNzR7/Taqj5BFWyBOHo0nRxU2OZo/Ik6KXUDC3DV0kmkPIWjYgiLbBn6YLtvKxA85oClkh582Em/lY3yQ=
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 SJ0PR01MB6352.prod.exchangelabs.com (2603:10b6:a03:293::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.23; Mon, 8 Feb 2021 22:48:41 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:48:41 +0000
From: Thang Nguyen OS <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: create meta-ampere folder in openbmc repo
Thread-Topic: create meta-ampere folder in openbmc repo
Thread-Index: AQHW05FtxubWmqNYTUGRYN8lAatuOKoFhiSAgBLcUQCAAMregIAmnh0AgADTt4CAAJLTAIACaJuAgAdDWACABEniAIAAAY7HgAACvoCAAAWKIQ==
Date: Mon, 8 Feb 2021 22:48:41 +0000
Message-ID: <BYAPR01MB46785A6ECF90F4C00F925FC38D8F9@BYAPR01MB4678.prod.exchangelabs.com>
References: <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
 <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
 <53126da0-c452-7c64-c3d4-735f38e518d3@os.amperecomputing.com>
 <20210208221222.42tgcozztspf3mru@thinkpad.fuzziesquirrel.com>
 <BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9@BYAPR01MB4678.prod.exchangelabs.com>,
 <20210208222745.zq5anx4y2br7wsnt@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210208222745.zq5anx4y2br7wsnt@thinkpad.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [58.186.197.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 767dbe4f-1a09-468e-8e93-08d8cc83aed7
x-ms-traffictypediagnostic: SJ0PR01MB6352:
x-microsoft-antispam-prvs: <SJ0PR01MB63521C0E6267E0F2AF306BF58D8F9@SJ0PR01MB6352.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: njy2NLV91EUQYA8dQR7z2xjPNVyDM2fuIMxH8GH+tYCOcpuGUpXE1i5uNUUDlpWMtI6ABOuBVagAslKiO610/puBMu5mCkTEvh3JRMeHPt7bvwpZ5YNV10ixFvethO0+RXe8GuCgqLbA4Gikza5Npka2Tb3cxRuTvC+dqoKA1+nlCWnj+asMT8csqNbyEaS82SYykFIOZrs6FZoi/PXc2YuWmjy1VWGUiC585grjjn+0a+O31d2WSymMbrfPXv10SRrFiVAcpZ7/FyZYrowMwwo4oWZ7f7Oh6U9aw2SIEtbpo3tYm9HrntbqSRqYFfaEORc44eFHEfU1FLHFS6bk57hHTvTubkSmi1qCP5Jd6uMbcJcfhn0lO2V8e50UeasRzuD0PlDzvuDMg6sLnc9dzL5AqWrV2RyZzozy1jtoO1witig5Fnk+SKuHTdtRhgw4pMh5yzq+YJpbs69jJcKwFO7cvbJhTyHx1ci6gIZUGw45ZQN3M7A7WwEY/Bx3rG/jJBOLQoVJZgfdZzCNsfl6Rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(9686003)(66446008)(4744005)(64756008)(186003)(86362001)(2906002)(8936002)(26005)(53546011)(4326008)(52536014)(478600001)(55016002)(6506007)(5660300002)(66556008)(66476007)(91956017)(66946007)(76116006)(8676002)(316002)(33656002)(7696005)(6916009)(71200400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?O51zoTMHTB8llY/bi1n0DmJHYEJ+wyI8J2n8vRaU8H+tr3Cn3bOqcLntvcX0?=
 =?us-ascii?Q?mLXDOsONf/5H/jP29N2gMlXPP+EmlkkapM6b92+2KoVbDIzRERlN4AEMHL8S?=
 =?us-ascii?Q?eiBOgKrmtlLilEPfvPTHTo1rxhavMsX2amZyzyJGICuK4XMiH5Y/EIwha3LT?=
 =?us-ascii?Q?sW22zyxzcszXyEgJcQqWKSPQbUQnFdvtjnrAmQ4Ag9mTEbuPnnI7VJ3agFyf?=
 =?us-ascii?Q?Qq8gJbzklCCUxg9DVO51omcOqr7dYjgvbzexcgFP0YjQBgA093fwiOBGrJT3?=
 =?us-ascii?Q?S83rO0GK2xoqaJHWBA+wj/fcbJQu54ei6akmgAJP9zPiaJFjxowP02TybdFA?=
 =?us-ascii?Q?STS9pbDFc409dnjqkRZuOrHvEfGh73BVKetsnPT/2hGg6+Z4jx30OiBgttIY?=
 =?us-ascii?Q?cDpLQ2JqJ3/JTDenMHUwlJxtyBnOgolIX4i2wDgCzdq38fZheFvWUL7z5VGK?=
 =?us-ascii?Q?jiVL5tF8CPKOp1OoJsEv5+qSlvIBMZ8/Muz7k3O5pipPpVcemeRGTTMSXDZc?=
 =?us-ascii?Q?WkfBLRqU6QsgmGio6mfkIvI8S6489Ne/IEjeIAJZwWfPMtOm5CAvVlBESpq3?=
 =?us-ascii?Q?uX2i0v18JR3ccHzBgYdhKDlZp8aY63EF7m4yD1VIQ2ba3RjMKj5xM2Ez4zNG?=
 =?us-ascii?Q?xNr9ySjwAFFd589ytRzUVUGR2x1XbMntVsLIdNCBFccVHuXsP0uPU9wWd8tz?=
 =?us-ascii?Q?vPMH2l6dzt2vsmt6XSKpsnzusWubozjDccx5OTGtrbItlgkQjeuHiKFS79VZ?=
 =?us-ascii?Q?U9g1Hhu2rU3zipitItMV+v2ZghayikHas2zq0/wYUoWlevA0l/NvE2Om2BEK?=
 =?us-ascii?Q?ZecVPoUHqjz91lHeMWlmTFJVW1jhhMGPHvFZouglTYjD9gv92RLsu+GNqUFw?=
 =?us-ascii?Q?UsAQFGSHjqxEWoCzfNBUlR+RnbEmLNd47EYymFbh1mpjNO0xpvVe9H0BsyjW?=
 =?us-ascii?Q?jnSs6GwHYM41mDfTf+gExFRREPW+NCpD7qaoiHQlXBYenFbkCKBtSccf6VBg?=
 =?us-ascii?Q?oBFVFh6KRgCDLuiapMYcsQpABiL4Xq8ETOqcNlgJRyGK/77tgM3SuNQxQ+Px?=
 =?us-ascii?Q?c3rGWo0Tk3s84Hn1U7ZZETI1B5YV53tv6TbbSdM2cnZbjrBSjVNC/pQDS1uF?=
 =?us-ascii?Q?mpL5rugcpDbtguqfCvyFBMZ7Ll2rTPEdszXtqq66neT1H/KIQHPFrnk3DyNu?=
 =?us-ascii?Q?haEz/gMYIsXUJ+RETK2zF5hXBPQU6FF2cSJOrJAUr2LzkPmFNI4l55vxUMRa?=
 =?us-ascii?Q?u6z7qwoYQ28oV75iRNaaelJlqP+hAltdxYxFy5HcdaC4Qb360ScGsRtAJDsT?=
 =?us-ascii?Q?E2++lpUIcrAWwXe4Qnbb1g4Q?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR01MB46785A6ECF90F4C00F925FC38D8F9BYAPR01MB4678prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767dbe4f-1a09-468e-8e93-08d8cc83aed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 22:48:41.8350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EFtuHij3mABVPFsN4qlRgNFi/iLFYZv5s41JFgqw6aZbK5pX44wTb+uI9a7FrFv2hYmWKk5ZqaFch61ogc5Qa9I/DjOjh04CW3qU96HxwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6352
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Lancelot.Kao@fii-usa.com" <Lancelot.Kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR01MB46785A6ECF90F4C00F925FC38D8F9BYAPR01MB4678prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Brad.
It works for me now. After rebasing the commit, the CI is triggered.

Thanks - ThangQ.
________________________________
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Sent: Tuesday, February 9, 2021 5:27:45 AM
To: Thang Nguyen OS <thang@os.amperecomputing.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Lancelot.Kao@fii-usa.com <=
Lancelot.Kao@fii-usa.com>
Subject: Re: create meta-ampere folder in openbmc repo

On Mon, Feb 08, 2021 at 10:18:49PM +0000, Thang Nguyen OS wrote:
>Hi Brad,
>I still not have the permission to trigger Ok-to-Test after adding myself =
to ci-authorized

Oh - right, setting Ok-to-Test is done by the OpenBMC CI user, based on
the group membership, so you don't need to set it manually.

thx - brad

--_000_BYAPR01MB46785A6ECF90F4C00F925FC38D8F9BYAPR01MB4678prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Thanks Brad.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
It works for me now. After rebasing the commit, the CI is triggered.</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto" style=3D"text-align: l=
eft;">
<div><br>
</div>
Thanks -&nbsp;ThangQ.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Brad Bishop &lt;bradl=
eyb@fuzziesquirrel.com&gt;<br>
<b>Sent:</b> Tuesday, February 9, 2021 5:27:45 AM<br>
<b>To:</b> Thang Nguyen OS &lt;thang@os.amperecomputing.com&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;; Lancelot.Kao@=
fii-usa.com &lt;Lancelot.Kao@fii-usa.com&gt;<br>
<b>Subject:</b> Re: create meta-ampere folder in openbmc repo</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Feb 08, 2021 at 10:18:49PM +0000, Thang Ng=
uyen OS wrote:<br>
&gt;Hi Brad,<br>
&gt;I still not have the permission to trigger Ok-to-Test after adding myse=
lf to ci-authorized<br>
<br>
Oh - right, setting Ok-to-Test is done by the OpenBMC CI user, based on <br=
>
the group membership, so you don't need to set it manually.<br>
<br>
thx - brad<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR01MB46785A6ECF90F4C00F925FC38D8F9BYAPR01MB4678prod_--
