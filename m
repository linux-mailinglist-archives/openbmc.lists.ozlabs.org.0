Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D209116FB
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 01:42:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=urh3LXDJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4xqc3l9dz3cc6
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 09:42:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=urh3LXDJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:2020::601; helo=ind01-max-obe.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2020::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4hDM0yC0z3cXd
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2024 23:29:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMpvenE6jvMux9PyPZ3wRq4pqfbgIA9Cby39bgw7WB+ZcyuBj6oIpM9fqdJ8FbcQT+mlUGKWV6sL6rvDXDWLfwOQAzQOpwz7hQ9+WKec69XquV/MblVpWifr/iTSYyUXyUs3CG1RGmxtJNjV1io0NSwOQwVyKFY+dWPS5FKxr/kCanEnxKpQcnKkhqs7wOJwzuOX18KPQzkvLqVMtPZu25Lav2GQtaW5X6tnZNQfzKKu5+DOyWNfQQUMfzkzkIf6wsNYo4ng4xn+wxAm2ctNK4MI39TBISyaEgXGO3rgWd9/SFfONLjKVO91xpDWYsnUJAQTsnwbBuvDKqMnOK6KYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDQ8kNI/2hEQ5npUJE1qEyIWzbt7ahqM4c3uoHYVD5A=;
 b=cim3tP4kVBYXdg/1i/FAcHyqBRy9fW9sBdtat6i4EsmVMEFQNFg8w8jNyAmpNQ5QXPIb21Rw2nFguOzSnsEgfQgA8DLBIVnacvmdyAaFTeqr9fooVMR565r4xL+fP9g04mcAASbte6oqDnyrktoQ1rsmD/F72pjjVPpqOn86NTH+HcOw8PXgq2J6Khb4qlg1HvV4S1G36f/H7G3uA7PakneQNGLivwhx3/sqo/GM39GdDugkKOX5S3xv/YtelFaLbZx3Pg15SNfIT5JHgBocWf0HdP+JFEKk/RwOcFpXfhKoPOOlreI0WyWilOXP+y5m5KQkC+ujL/Hio3oZ35EPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDQ8kNI/2hEQ5npUJE1qEyIWzbt7ahqM4c3uoHYVD5A=;
 b=urh3LXDJ+35AKmts3j5dCw7aSWjKk0jLupRFEsXuqAwXTOydTvqfTHgtlI9TsQqG8L02sd+jQiG7sZvic3azTwEcnozULrL5dCljZpTtGZFHHq4jyaPGlCXE5y9jNGLx6IlJ/9Jl2dVBHMm4fP9mlrO61t8YIPOHXWQMHYDuoz6RFPM11LTqJJ1sy4zN8edSFV7PrLegZztNP5khB1sXvlJEEs1rBVZ9kiPWJX0RL5GBEryUnE/Uk3iW1SIQ3ZSiRSvP0+9dN+Lid7c3MO2u3HySRNG605BlCT0RumwYTXgTcXkEPzhXuoPTw7Bv6IOQq+NwrC0M54YkU4e22z8Hew==
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::13)
 by MAZPR01MB7732.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 13:29:18 +0000
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a]) by MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 13:29:18 +0000
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: Help with IPMB (IPMI over I2C).
Thread-Topic: Help with IPMB (IPMI over I2C).
Thread-Index: AQHawvq3HaRNbNKpv0ezQLXMYofq67HQluEAgAAFYqaAAAjmqQ==
Date: Thu, 20 Jun 2024 13:29:18 +0000
Message-ID:  <MA1PR01MB43082375F4F0563E9E6AB23080C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
References:  <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <ZnQiNlMOYE0ATrKK@nbwork.lan>
 <MA1PR01MB4308550B7CF6199FE4E5433A80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To:  <MA1PR01MB4308550B7CF6199FE4E5433A80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4308:EE_|MAZPR01MB7732:EE_
x-ms-office365-filtering-correlation-id: 702ae196-80dc-4a82-0d9f-08dc912cfc93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info:  =?us-ascii?Q?+aAsucwjX9al7PfwHH0tBFvbcP1JrXypK13m8gZmq3//lUrPViNRCJRdM6/D?=
 =?us-ascii?Q?773fdGUxkynwJISCu2SIb3mGxGbNfD48NxjAySAauD+QGTn1ZQHSTJzRlob0?=
 =?us-ascii?Q?+2MBqHHJkA2z9xcYRziRqdCqDeBN9sfdJIVxIO63xWSFxxk7BAkUxd7OATKB?=
 =?us-ascii?Q?NUtdkUfzccpLQmVoP+y7Ce552c3MjnPIoP1dLskAX5uu3FfdElGegLdLzwLz?=
 =?us-ascii?Q?n02ZVeS7T+Ic3sZddJXic1ChOCsHW4vwSxbNPeYp6GNNEVsd2oaSK/heNt3U?=
 =?us-ascii?Q?ehPu1vM2FHNyJRoOHY6CL85g51xNYy6aHzAlGcX3nsYs3ZoYEORHAcjYIsTD?=
 =?us-ascii?Q?iPobtoRMY9JQCU0IYFU1KURYvD4LCopc3ySHy73V2v4pxOq9WGFxaxOhCggm?=
 =?us-ascii?Q?eNCS0bQIiBLf0i0a1bZWl/Tm5Q4E9MWb3eNmHKMQAAvGq2W8hW55ftHolX8K?=
 =?us-ascii?Q?lPQeFozKnpTbjErGsamKwdBhbYskPMncXNb6N5DvrpWKK4gc/6tZqg5CNsLx?=
 =?us-ascii?Q?5+L9s2LVuAvh9Yls1kDOEHnEAedBGhPYkrc0J3J/J/QGbxPx1Yfb4Lwi1ljN?=
 =?us-ascii?Q?Hu3LjeLaaNzt0GzT5LzDwmnJT33HJ1o3zTwfjbGvCQuUPGO/es2JX/5vN57i?=
 =?us-ascii?Q?RHiZX3VRLtg6maepfwNKfrtgZX40/Cop+E3A6qvZa+IcEPzeZCnkp1IJk/Gs?=
 =?us-ascii?Q?kb6IIT3lJ976jf73Q2/tWzAbzt9DJq69j/eS7zc6FJll081wZOK/SfLlagIT?=
 =?us-ascii?Q?WUngx/KQaupmnrQbEuQj/tvWB+bW9VWM8AG1CatFr9afOqDKrN0uGtOf6yMx?=
 =?us-ascii?Q?/9nTHDYtF1aGWLSiiBRCn/mtfZ/L6+ld5RX2XRj0nYXVlQH8xNkOv2EXKf0X?=
 =?us-ascii?Q?lV+/VUKr5sjAxPmCcNGa5fU/10Et4V6va4lfWJlhS1e4XYe/zOomSuTc4iGQ?=
 =?us-ascii?Q?RaBG6QyfvEQvIOC9d2W8S4pv1tTS4dDogxme5vFNzBDEBCe7NVy7lY3lttSV?=
 =?us-ascii?Q?BUYmqbZWKIsZPPhZZ6sxm5G5sxZ9BxYgBk1JfcWMFDCjLqKTiAbuMhnteEv5?=
 =?us-ascii?Q?v6Xe+W3VyP/7S3xNVQgyG5mfFMw2ykacqJu5IhYXdMTwh6ZAX5TUiceVCsEL?=
 =?us-ascii?Q?FUPwEyAAVji1ht0wwIhtnpO9Gr88sb/ra+NUlaojBnaN9N1nw4ZqJv7eSxHz?=
 =?us-ascii?Q?6QmYvHu/GpVdvwLELQOISnpcfLlgiWuY98rbrr4U0q4kYlLhb5qQeTrMdhqs?=
 =?us-ascii?Q?4kcau9gyfpXCGTSGJ6Gm+FoiU176OfroMX5P6WyvfF12FccM1QgtteiffYCi?=
 =?us-ascii?Q?acrrJ98L+WQC1k5OvXSJNmhN0DkRTkzX8TehpkWFrj2sdg=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ALwlrKhs+4rwXk5ywN7aKw2KWB2tO6piVvWy3j3yqnyhDpD5NPBQyR1LWhYd?=
 =?us-ascii?Q?ByQ1kN7EZht5ctttYr8NVyjk88Gyrjgh80zVzketzXkat+OgeLciW+rdvDJy?=
 =?us-ascii?Q?WfLZgmt3yfig8a7VJVI+c6OuIpUnIkwGubhUkUNQMyKLqff22bcuO3NVKopw?=
 =?us-ascii?Q?FyShGUYqItJl/JlV1dLdQGobf2151U/t/T1aHSzJpaZcWPKC4gG0RAtSHP4R?=
 =?us-ascii?Q?T7Sl9m7/K5RHltME0ZIxhyC/3PsWNR9iTfmdvuJfa3fhL6w3/4bmHLkYBons?=
 =?us-ascii?Q?R/Xv0RfZDTblbZV64lp9ei9Oeh27qnjN+u1GNdKKJbqBjMM0NcKw2kzFz0Mj?=
 =?us-ascii?Q?iU3Z2LgJDTKX74HKL1qudHvCrcGkjlPEdunuVO43xb/K7R6Nr267HLjGKYuK?=
 =?us-ascii?Q?9HfK6+dvUzFl39DanWtdSS2+/zvBlhGRbLN7kMkDpMkCw3tBcVomC5fFwWxa?=
 =?us-ascii?Q?Tyc2c6YwC/vk+6o4KVT8s9qCodrfjJt3cfWMlVV9/jgn2mbtWFNxkTKPcI/k?=
 =?us-ascii?Q?kCxN2N2XI7qXyu16GzZoXMQ8mPvjAOizEfZFzmr8QwEYDJ1CcWsk1M7dDoPF?=
 =?us-ascii?Q?P9J7V4c8Pjzpy5h/0ex6YwLzqBtk8c4/k4zIGtDcdrIvtK6osEYV8WkQ0n1m?=
 =?us-ascii?Q?ziZ/zOsGLu4ryfck/+vznChn6WOe94iDJX0jo0vqytL1bTZIMMuFSD8OtEl1?=
 =?us-ascii?Q?XHyqRUwS8Rksi7Ycl8BZMPDK93eyYxQwwD2H7pi9QTAQ6ePLgDST/HzFPpgL?=
 =?us-ascii?Q?PyaKhFapEJ40HPKaLdikzrT3scjundTAvVsEQ8lHsT4uXavQKCCWfVe3f7Qh?=
 =?us-ascii?Q?o2Vlx3Y3HqICFkKZDmVLmfhZUT/qzQO2IZg6ejGuJUtaVx2XjU7OemFx2emA?=
 =?us-ascii?Q?tWr/Cuf3SeGUh/i9AtPxaQjxSpNU6n+0ZL3R9SnxWs/wwwgzAzt3lpkqbh+z?=
 =?us-ascii?Q?Ynu+X8QAiKL6Nmams1MxMVnaDu2LZpkvUj/Zx5L0uq3bs4k5k4yYCF0xQfxv?=
 =?us-ascii?Q?DXjk7/CU1vjyveLef16Py9XfN4AU1HDovUbj2lco5xrZtRNxIYCon8Gt1G6H?=
 =?us-ascii?Q?raB7icWnkBAZQQ4astKJIBmTGvt0QusJhTRWdnN0wgcukxdAuG3KVn7H3wtO?=
 =?us-ascii?Q?I9k4ZWIweyWnmSq1kn26/McII6qFtuC3IHEy4/5TIwIv21/y1fQbI0estuL7?=
 =?us-ascii?Q?PvRzAdv1QQJTW01TptahQnBjrYD6qmPKxROtBHGTD/MGiFxhMXNTZuiCr5Ot?=
 =?us-ascii?Q?6XLs+qr1HuffiqSZhfvqNPA4qkBX3BskDcUkvtmLJWb3vcuuGg1C66gmd/kf?=
 =?us-ascii?Q?twEKaJoDzadj75Wgynvgewlcwhr675jmQi/TXAqxQRWV2Rq7hfsG4STd9XqQ?=
 =?us-ascii?Q?OH2PbmsSRyeE04kV0orU/FM+gZxdMKNgibce4cqhke3dSTuHNZe8BsLvAUer?=
 =?us-ascii?Q?cjVcvoTRtITY2yS7uW51XM5Wyt9uBaGR+8MHioQNmTJHPUBybElu/XSiTZYW?=
 =?us-ascii?Q?s0lE3r9WtD25Kr1aC1h0gZI+QWtnrJBwfg5VhWMzHBYF3yVXzWvP/hqAalC5?=
 =?us-ascii?Q?RD88nD1QIlt2L0KsoYbvWEtggAsHHPcB9W89D5Coyn2SIpg+EWgyrxGpeiBW?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: multipart/related;
	boundary="_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 702ae196-80dc-4a82-0d9f-08dc912cfc93
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 13:29:18.1740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhVPoX1Cf+Xl2GAIekDazs7qOTwt+Idj9tWSygY6iHVGrrM5sANWd/Fc0KG2827Hkm0MfEJXOt6HnGsY8Arzj5YuOd/ocTrNP4n1oaG+SsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7732
X-Mailman-Approved-At: Fri, 21 Jun 2024 09:41:12 +1000
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
Cc: Thangaraj S <Thangaraj.S@Ltts.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_"

--_000_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Thanks for your reply,

ipmitool has raw and i2c commands.

Commands:
        raw           Send a RAW IPMI request and print response
        i2c           Send an I2C Master Write-Read command and print respo=
nse
        spd           Print SPD info from remote I2C device
        lan           Configure LAN Channels


As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c<htt=
ps://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c> which is handl=
ing I2C Master Read-Write functionality.

Can you please guide us on this, Whether we can use this to perform BMC-to-=
BMC communication.

Below is the error i'm getting while performing BMC-to-BMC Master-Slave Rea=
d-Write by connecting two i2c buses between the boards.
root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x32=
 0x33 0x34
ipmi_master_write_read: rsp_value:6207408, LineNo:104
I2C Master Write-Read command failed: Invalid command
ipmi_rawi2c_main: rsp_value:0, LineNo:264
Unable to perform I2C Master Write-Read

Thanks, and regards,
Bala Subramaniyan M,




[cid:8c0f8170-e1d0-4031-a57d-20b6a72ccf58]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



________________________________
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
Sent: Thursday, June 20, 2024 6:55 PM
To: Alexander A. Filippov <a.filippov@yadro.com>
Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <Thang=
araj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
Subject: Re: Help with IPMB (IPMI over I2C).

Hi Alexander,

Thanks for your reply,

ipmitool has raw and i2c commands, Please refer below image.

[cid:87b5aef4-9628-47c7-b7d4-b714b7a92869]

As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c<htt=
ps://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c> which is handl=
ing I2C Master Read-Write functionality.

Can you please guide us on this, Whether we can use this to perform BMC-to-=
BMC communication.

Below is the error i'm getting while performing BMC-to-BMC Master-Slave Rea=
d-Write by connecting two i2c buses between the boards.
root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x32=
 0x33 0x34
ipmi_master_write_read: rsp_value:6207408, LineNo:104
I2C Master Write-Read command failed: Invalid command
ipmi_rawi2c_main: rsp_value:0, LineNo:264
Unable to perform I2C Master Write-Read


Thanks, and regards,
Bala Subramaniyan M,



[cid:08db76b7-f643-4b96-8acd-5325e19c1e99]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



________________________________
From: Alexander A. Filippov <a.filippov@yadro.com>
Sent: Thursday, June 20, 2024 6:06 PM
To: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <Thang=
araj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
Subject: Re: Help with IPMB (IPMI over I2C).

CAUTION: This email is from an external source. Please do not open attachme=
nts or click links from an unknown or suspicious origin. Phishing attempts =
can be reported by using the report message button in Outlook or sending th=
em as an attachment to phishing@Ltts.com. Thank you

On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:
> Hi All,

Hi,

>
> For one of our requirement (BMC to BMC, IPMI over I2C), We're exploring w=
ith IPMITOOL<https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=3D05%7C02%7CBala.Subramaniyan%40=
ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba=
60a%7C0%7C0%7C638544837919310123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3Dx=
V3gj1uMoigTrD9EV%2FzSYWUCrQG9KBqM8RMHAfkbjL4%3D&reserved=3D0<https://github=
.com/openbmc/ipmitool>>.
>
> Development Board: ASPEED AST2600 EVB
>
> Could you please suggest us how to proceed further with our below require=
ment.
>
>   1.
> BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
>   2.
> Send/Receive IPMI commands through IPMITOOL<https://ind01.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913=
a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919318108%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C60000%7C%7C%7C&sdata=3D2Ofk6FFhvtt9DE2Ku6l9E%2Bogf4rDoAnKLJ8IaKCAv=
nA%3D&reserved=3D0<https://github.com/openbmc/ipmitool>> from one BMC to ot=
her.
>   3.
> Send/Receive SDR, SEL logs between two BMC's.
>
> Any help would be highly appreciated.
>
>

As I can see, ipmitool has no any interfaces using i2c directly and I never
listen about using i2c as the ipmi transport.

Google shows me that the similar question already exists and answered:
  https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&data=3D05%7C02%7CBala.Subra=
maniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33=
fe80a3d8ba60a%7C0%7C0%7C638544837919323925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C=
&sdata=3DCAO3AlVSwGz7qeFnakA69orWVnat2mADwtIrvMsLtX4%3D&reserved=3D0<https:=
//github.com/ipmitool/ipmitool/discussions/296>

As an alternative, You could use lan/lanplus interfaces to communicate with
remote BMC via ethernet.


>
> Thanks, and regards,
> Bala Subramaniyan M,
>
>
>
> [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]<https://ind01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala=
.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4=
b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919328258%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C=
%7C%7C&sdata=3DUSGH2E9jlgxi8PFwnWtNVmkyHbhtghu94%2BdpEsvGors%3D&reserved=3D=
0>
>
>
> S1 Building, L&T Tech Park, Bellary Road,
>
> Next to Raintree Boulevard, Park View Layout,
>
> Byatarayanapura, Bengaluru-560092
>
> Mobile: +91 9677035467
>
> ENGINEERING THE CHANGE | https://ind01.safelinks.protection.outlook.com/?=
url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltt=
s.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a=
%7C0%7C0%7C638544837919332294%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3D9Uv9=
AWzo8JPFstuhNWEwB15fAnmslAUHG3jXjdavo2U%3D&reserved=3D0<https://ind01.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%=
7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C31=
1b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919336367%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C60000%7C%7C%7C&sdata=3DKpop%2FwYjGgXiYRbB%2B8xGf%2FdUsbl4ZLp8Hl1YuomzM30=
%3D&reserved=3D0><http://www.ltts.com/>
>
>
>
> [Ltts.com]
>
> L&T Technology Services Ltd
>
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.lt=
ts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a=
56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C63854483791934=
0087%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3Dc46N5pRUVu%2BehD5RAcs3WXkECAo=
bFoEhSCy0LZzqItA%3D&reserved=3D0<http://www.ltts.com/>
>
> L&T Technology Services Limited (LTTS) is committed to safeguard your pri=
vacy. Read the appropriate privacy notice<https://ind01.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notices&=
data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc912=
5913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919344116%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3DBwUKKDaLa%2BfTW2xoVVWwnWXnj11QQ3EPqVfcj=
3Y175A%3D&reserved=3D0<https://www.ltts.com/privacy-policies-notices>> appl=
icable to you to know more about how LTTS collects, uses and stores your pe=
rsonal data. Please visit our privacy policy<https://ind01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&da=
ta=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc91259=
13a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919348226%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C60000%7C%7C%7C&sdata=3DWUa8W%2BHcu%2FaFmtd23zvWkveaKXnSUpz6%2Fa7=
yf%2FqhpbE%3D&reserved=3D0<https://www.ltts.com/data-privacy-policy>> avail=
able on our website https://ind01.safelinks.protection.outlook.com/?url=3Dh=
ttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7=
Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C=
0%7C638544837919352183%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3Dua8rLzmy8kk=
c2ePqG5xBoT8F7aEv8dnC4%2B7EcIFeTFk%3D&reserved=3D0<http://www.ltts.com/> fo=
r more information about our commitment towards data privacy under applicab=
le data protection laws. This email may contain confidential or privileged =
information for the intended recipient(s). If you are not the intended reci=
pient, please do not use or disseminate the information, notify the sender =
and delete it from your system.

--
Regads,
Alexander Filippov




--_000_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
Hi Alexander,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for your reply,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
ipmitool has raw and i2c commands.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 128);">Commands:</span></div=
>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 128);">&nbsp; &nbsp; &nbsp; =
&nbsp; raw &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Send a RAW IPMI request and p=
rint response</span></div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 128);">&nbsp; &nbsp; &nbsp; =
&nbsp; i2c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Send an I2C Master Write-Read=
 command and print response</span></div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 128);">&nbsp; &nbsp; &nbsp; =
&nbsp; spd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Print SPD info from remote I2=
C device</span></div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 128);">&nbsp; &nbsp; &nbsp; =
&nbsp; lan &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Configure LAN Channels</span>=
</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
As,<i>&nbsp;</i>I can see ipmi_rawi2c_main() function under <a href=3D"http=
s://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c" target=3D"_blan=
k" id=3D"OWAd697bb4f-66b7-308b-262b-73aa4eccee3b" class=3D"OWAAutoLink" tit=
le=3D"https://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c" rel=
=3D"noopener noreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0" s=
tyle=3D"margin: 0px;">
ipmitool/lib/ipmi_raw.c</a>&nbsp;which is handling I2C Master Read-Write fu=
nctionality.<br>
<br>
Can you please guide us on this, Whether we can use this to perform BMC-to-=
BMC communication.</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Below is the error i'm getting while performing BMC-to-BMC Master-Slave Rea=
d-Write by connecting two i2c buses between the boards.</div>
<div style=3D"margin: 1em 0px; font-family: Arial, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 192, 128);">root@ast2600-default:=
~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x32 0x33 0x34&nbsp;</spa=
n></div>
<div class=3D"elementToProof" style=3D"margin: 1em 0px; font-family: Arial,=
 Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 192, 128);">ipmi_master_write_rea=
d: rsp_value:6207408, LineNo:104<br>
I2C Master Write-Read command failed: Invalid command<br>
ipmi_rawi2c_main: rsp_value:0, LineNo:264<br>
Unable to perform I2C Master Write-Read</span></div>
<div id=3D"Signature">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Thanks, and regards,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Bala Subramaniyan M,</b></div>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><img id=3D"Picture_x0020_12" width=3D"330" height=
=3D"2" style=3D"width: 330px; height: 2px; max-width: 728px; margin-top: 0p=
x; margin-bottom: 0px;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:f4c69f42-=
6682-4abe-b4b8-9b79f73e6c62"></span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><a href=3D"https://www.ltts.com/" style=3D"color: =
rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x002=
0_2" width=3D"249" height=3D"38" style=3D"width: 249px; height: 38px; max-w=
idth: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:=
1|T:1" src=3D"cid:8c0f8170-e1d0-4031-a57d-20b6a72ccf58"></a></span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;"><b=
r>
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">S1=
 Building, L&amp;T Tech Park, Bellary Road,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Ne=
xt to Raintree Boulevard, Park View Layout,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">By=
atarayanapura, Bengaluru-560092</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Mo=
bile: +91 9677035467</span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(13, 13, 13); line-height: 150%;"=
>ENGINEERING<b> THE CHANGE</b></span><span style=3D"font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 150%=
;">
 | </span><span style=3D"font-family: Arial, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(13, 13, 13); line-height: 150%;"><a href=3D"https://ww=
w.ltts.com/" style=3D"color: rgb(13, 13, 13); margin-top: 0px; margin-botto=
m: 0px;">www.LTTS.com</a></span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><img id=3D"Picture_x0=
020_12" width=3D"330" height=3D"2" style=3D"width: 330px; height: 2px; max-=
width: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:5bcd4c95-2833-4085-8b6f-84700b7f9f56"></span></p>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bala Subramaniyan &lt=
;Bala.Subramaniyan@Ltts.com&gt;<br>
<b>Sent:</b> Thursday, June 20, 2024 6:55 PM<br>
<b>To:</b> Alexander A. Filippov &lt;a.filippov@yadro.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Thang=
araj S &lt;Thangaraj.S@Ltts.com&gt;; Lalit Kumar &lt;Lalit.Kumar2@ltts.com&=
gt;<br>
<b>Subject:</b> Re: Help with IPMB (IPMI over I2C).</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0)">
Hi Alexander,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0)">
Thanks for your reply,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0)">
ipmitool has raw and i2c commands, Please refer below image.&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"x_Signature">
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<span><img size=3D"122453" style=3D"max-width:607px" data-outlook-trace=3D"=
F:2|T:2" src=3D"cid:87b5aef4-9628-47c7-b7d4-b714b7a92869"></span></div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
As,<i>&nbsp;</i>I can see ipmi_rawi2c_main() function under <a href=3D"http=
s://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c" id=3D"LPlnk1543=
30" class=3D"x_OWAAutoLink" title=3D"https://github.com/openbmc/ipmitool/bl=
ob/master/lib/ipmi_raw.c">
ipmitool/lib/ipmi_raw.c</a>&nbsp;which is handling I2C Master Read-Write fu=
nctionality.<br>
<br>
Can you please guide us on this, Whether we can use this to perform BMC-to-=
BMC communication.</div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
Below is the error i'm getting while performing BMC-to-BMC Master-Slave Rea=
d-Write by connecting two i2c buses between the boards.</div>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,128,0)">root@ast2600-default:~# ipm=
itool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x32 0x33 0x34&nbsp;</span></di=
v>
<div style=3D"margin-top:1em; margin-bottom:1em; font-family:Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,128,0)">ipmi_master_write_read: rsp=
_value:6207408, LineNo:104<br>
I2C Master Write-Read command failed: Invalid command<br>
ipmi_rawi2c_main: rsp_value:0, LineNo:264<br>
Unable to perform I2C Master Write-Read<br>
</span></div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<b>Thanks, and regards,</b></div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<b>Bala Subramaniyan M,</b></div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; color=
:rgb(0,0,0)">
<span><img id=3D"x_Picture_x0020_12" width=3D"330" height=3D"2" style=3D"wi=
dth:330px; height:2px; max-width:728px; margin-top:0px; margin-bottom:0px" =
data-outlook-trace=3D"F:2|T:2" src=3D"cid:8e9aff04-3d96-4bb4-9c19-0645b7e85=
2a4"></span></div>
<p><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; c=
olor:rgb(0,0,0)"><br>
</span></p>
<p><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:12pt; c=
olor:rgb(0,0,0)"><a href=3D"https://www.ltts.com/" id=3D"OWA23ba9490-8084-c=
b96-d8bc-1305e121866c" class=3D"x_OWAAutoLink" style=3D"color:rgb(0,0,0); m=
argin-top:0px; margin-bottom:0px"><img id=3D"x_Graphic_x0020_2" width=3D"24=
9" height=3D"38" style=3D"width:249px; height:38px; max-width:728px; margin=
-top:0px; margin-bottom:0px" data-outlook-trace=3D"F:2|T:2" src=3D"cid:08db=
76b7-f643-4b96-8acd-5325e19c1e99"></a></span></p>
<p style=3D"line-height:115%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(0,0,0); line-height:115%"><br>
</span></p>
<p style=3D"line-height:115%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(0,0,0); line-height:115%">S1 Building, =
L&amp;T Tech Park, Bellary Road,
</span></p>
<p style=3D"line-height:115%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(0,0,0); line-height:115%">Next to Raint=
ree Boulevard, Park View Layout,
</span></p>
<p style=3D"line-height:115%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(0,0,0); line-height:115%">Byatarayanapu=
ra, Bengaluru-560092</span></p>
<p style=3D"line-height:115%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(0,0,0); line-height:115%">Mobile: +91 9=
677035467</span></p>
<p style=3D"line-height:150%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(13,13,13); line-height:150%">ENGINEERIN=
G<b> THE CHANGE</b></span><span style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:12pt; color:rgb(0,0,0); line-height:150%">
 | </span><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:=
12pt; color:rgb(13,13,13); line-height:150%"><a href=3D"https://www.ltts.co=
m/" id=3D"OWA1ee078ba-3851-8e42-9376-8ec8bc4a00f7" class=3D"x_OWAAutoLink" =
style=3D"color:rgb(13,13,13); margin-top:0px; margin-bottom:0px">www.LTTS.c=
om</a></span></p>
<p style=3D"line-height:150%"><span style=3D"font-family:Arial,Helvetica,sa=
ns-serif; font-size:12pt; color:rgb(0,0,0)"><img id=3D"x_Picture_x0020_12" =
width=3D"330" height=3D"2" style=3D"width:330px; height:2px; max-width:728p=
x; margin-top:0px; margin-bottom:0px" data-outlook-trace=3D"F:2|T:2" src=3D=
"cid:15cbe041-9a4c-448d-9049-10acf4d98b93"></span></p>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alexander A. Filipp=
ov &lt;a.filippov@yadro.com&gt;<br>
<b>Sent:</b> Thursday, June 20, 2024 6:06 PM<br>
<b>To:</b> Bala Subramaniyan &lt;Bala.Subramaniyan@Ltts.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Thang=
araj S &lt;Thangaraj.S@Ltts.com&gt;; Lalit Kumar &lt;Lalit.Kumar2@ltts.com&=
gt;<br>
<b>Subject:</b> Re: Help with IPMB (IPMI over I2C).</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">CAUTION: This email is from an external source. =
Please do not open attachments or click links from an unknown or suspicious=
 origin. Phishing attempts can be reported by using the report message butt=
on in Outlook or sending them as an
 attachment to phishing@Ltts.com. Thank you<br>
<br>
On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:<br>
&gt; Hi All,<br>
<br>
Hi,<br>
<br>
&gt;<br>
&gt; For one of our requirement (BMC to BMC, IPMI over I2C), We're explorin=
g with IPMITOOL&lt;<a href=3D"https://github.com/openbmc/ipmitool">https://=
ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fop=
enbmc%2Fipmitool&amp;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8=
ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638=
544837919310123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&amp;sdata=3DxV3gj1uMoigTrD=
9EV%2FzSYWUCrQG9KBqM8RMHAfkbjL4%3D&amp;reserved=3D0</a>&gt;.<br>
&gt;<br>
&gt; Development Board: ASPEED AST2600 EVB<br>
&gt;<br>
&gt; Could you please suggest us how to proceed further with our below requ=
irement.<br>
&gt;<br>
&gt;&nbsp;&nbsp; 1.<br>
&gt; BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.<br>
&gt;&nbsp;&nbsp; 2.<br>
&gt; Send/Receive IPMI commands through IPMITOOL&lt;<a href=3D"https://gith=
ub.com/openbmc/ipmitool">https://ind01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&amp;data=3D05%7C02%7CBala=
.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4=
b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919318108%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C=
%7C%7C&amp;sdata=3D2Ofk6FFhvtt9DE2Ku6l9E%2Bogf4rDoAnKLJ8IaKCAvnA%3D&amp;res=
erved=3D0</a>&gt;
 from one BMC to other.<br>
&gt;&nbsp;&nbsp; 3.<br>
&gt; Send/Receive SDR, SEL logs between two BMC's.<br>
&gt;<br>
&gt; Any help would be highly appreciated.<br>
&gt;<br>
&gt;<br>
<br>
As I can see, ipmitool has no any interfaces using i2c directly and I never=
<br>
listen about using i2c as the ipmi transport.<br>
<br>
Google shows me that the similar question already exists and answered:<br>
&nbsp; <a href=3D"https://github.com/ipmitool/ipmitool/discussions/296">htt=
ps://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com=
%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&amp;data=3D05%7C02%7CBala.Subram=
aniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33f=
e80a3d8ba60a%7C0%7C0%7C638544837919323925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&=
amp;sdata=3DCAO3AlVSwGz7qeFnakA69orWVnat2mADwtIrvMsLtX4%3D&amp;reserved=3D0=
</a><br>
<br>
As an alternative, You could use lan/lanplus interfaces to communicate with=
<br>
remote BMC via ethernet.<br>
<br>
<br>
&gt;<br>
&gt; Thanks, and regards,<br>
&gt; Bala Subramaniyan M,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]&lt;https://ind01.safelinks.=
protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7=
C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311=
b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919328258%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C60000%7C%7C%7C&amp;sdata=3DUSGH2E9jlgxi8PFwnWtNVmkyHbhtghu94%2BdpEsvGors%=
3D&amp;reserved=3D0&gt;<br>
&gt;<br>
&gt;<br>
&gt; S1 Building, L&amp;T Tech Park, Bellary Road,<br>
&gt;<br>
&gt; Next to Raintree Boulevard, Park View Layout,<br>
&gt;<br>
&gt; Byatarayanapura, Bengaluru-560092<br>
&gt;<br>
&gt; Mobile: +91 9677035467<br>
&gt;<br>
&gt; ENGINEERING THE CHANGE | <a href=3D"http://www.ltts.com/">https://ind0=
1.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;=
data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc912=
5913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919332294%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C60000%7C%7C%7C&amp;sdata=3D9Uv9AWzo8JPFstuhNWEwB15fAnmslAUHG3j=
Xjdavo2U%3D&amp;reserved=3D0&lt;https://ind01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Subraman=
iyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe8=
0a3d8ba60a%7C0%7C0%7C638544837919336367%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&am=
p;sdata=3DKpop%2FwYjGgXiYRbB%2B8xGf%2FdUsbl4ZLp8Hl1YuomzM30%3D&amp;reserved=
=3D0&gt;</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; [Ltts.com]<br>
&gt;<br>
&gt; L&amp;T Technology Services Ltd<br>
&gt;<br>
&gt; <a href=3D"http://www.ltts.com/">https://ind01.safelinks.protection.ou=
tlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Sub=
ramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea=
33fe80a3d8ba60a%7C0%7C0%7C638544837919340087%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%=
7C&amp;sdata=3Dc46N5pRUVu%2BehD5RAcs3WXkECAobFoEhSCy0LZzqItA%3D&amp;reserve=
d=3D0</a><br>
&gt;<br>
&gt; L&amp;T Technology Services Limited (LTTS) is committed to safeguard y=
our privacy. Read the appropriate privacy notice&lt;<a href=3D"https://www.=
ltts.com/privacy-policies-notices">https://ind01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notices&amp;dat=
a=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc912591=
3a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919344116%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C60000%7C%7C%7C&amp;sdata=3DBwUKKDaLa%2BfTW2xoVVWwnWXnj11QQ3EPqVfc=
j3Y175A%3D&amp;reserved=3D0</a>&gt;
 applicable to you to know more about how LTTS collects, uses and stores yo=
ur personal data. Please visit our privacy policy&lt;<a href=3D"https://www=
.ltts.com/data-privacy-policy">https://ind01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&amp;data=3D05%7C=
02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b=
33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919348226%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C60000%7C%7C%7C&amp;sdata=3DWUa8W%2BHcu%2FaFmtd23zvWkveaKXnSUpz6%2Fa7yf%2Fq=
hpbE%3D&amp;reserved=3D0</a>&gt;
 available on our website <a href=3D"http://www.ltts.com/">https://ind01.sa=
felinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913=
a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919352183%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C60000%7C%7C%7C&amp;sdata=3Dua8rLzmy8kkc2ePqG5xBoT8F7aEv8dnC4%2B7Ec=
IFeTFk%3D&amp;reserved=3D0</a>
 for more information about our commitment towards data privacy under appli=
cable data protection laws. This email may contain confidential or privileg=
ed information for the intended recipient(s). If you are not the intended r=
ecipient, please do not use or disseminate
 the information, notify the sender and delete it from your system.<br>
<br>
--<br>
Regads,<br>
Alexander Filippov<br>
<br>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_--

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=122453;
	creation-date="Thu, 20 Jun 2024 13:07:32 GMT";
	modification-date="Thu, 20 Jun 2024 13:27:13 GMT"
Content-ID: <87b5aef4-9628-47c7-b7d4-b714b7a92869>
Content-Transfer-Encoding: base64

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
5UFaWDkAAAAASUVORK5CYII=

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-3vqibvmn.png"
Content-Description: Outlook-3vqibvmn.png
Content-Disposition: inline; filename="Outlook-3vqibvmn.png"; size=99;
	creation-date="Thu, 20 Jun 2024 13:25:38 GMT";
	modification-date="Thu, 20 Jun 2024 13:27:13 GMT"
Content-ID: <8e9aff04-3d96-4bb4-9c19-0645b7e852a4>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-pdp4i4se.png"
Content-Description: Outlook-pdp4i4se.png
Content-Disposition: inline; filename="Outlook-pdp4i4se.png"; size=5482;
	creation-date="Thu, 20 Jun 2024 13:25:38 GMT";
	modification-date="Thu, 20 Jun 2024 13:27:13 GMT"
Content-ID: <08db76b7-f643-4b96-8acd-5325e19c1e99>
Content-Transfer-Encoding: base64

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
AABJRU5ErkJggg==

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-qfkgjwgm.png"
Content-Description: Outlook-qfkgjwgm.png
Content-Disposition: inline; filename="Outlook-qfkgjwgm.png"; size=99;
	creation-date="Thu, 20 Jun 2024 13:25:38 GMT";
	modification-date="Thu, 20 Jun 2024 13:27:13 GMT"
Content-ID: <15cbe041-9a4c-448d-9049-10acf4d98b93>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-dfbvx253.png"
Content-Description: Outlook-dfbvx253.png
Content-Disposition: inline; filename="Outlook-dfbvx253.png"; size=99;
	creation-date="Thu, 20 Jun 2024 13:29:17 GMT";
	modification-date="Thu, 20 Jun 2024 13:29:17 GMT"
Content-ID: <f4c69f42-6682-4abe-b4b8-9b79f73e6c62>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-21jb3dlu.png"
Content-Description: Outlook-21jb3dlu.png
Content-Disposition: inline; filename="Outlook-21jb3dlu.png"; size=5482;
	creation-date="Thu, 20 Jun 2024 13:29:17 GMT";
	modification-date="Thu, 20 Jun 2024 13:29:17 GMT"
Content-ID: <8c0f8170-e1d0-4031-a57d-20b6a72ccf58>
Content-Transfer-Encoding: base64

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
AABJRU5ErkJggg==

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-callpznc.png"
Content-Description: Outlook-callpznc.png
Content-Disposition: inline; filename="Outlook-callpznc.png"; size=99;
	creation-date="Thu, 20 Jun 2024 13:29:17 GMT";
	modification-date="Thu, 20 Jun 2024 13:29:17 GMT"
Content-ID: <5bcd4c95-2833-4085-8b6f-84700b7f9f56>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_010_MA1PR01MB43082375F4F0563E9E6AB23080C82MA1PR01MB4308INDP_--
