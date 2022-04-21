Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29D5096EC
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 07:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkRJ523bLz2ync
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 15:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=DL0oDy+i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=7110779bee=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=DL0oDy+i; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkRHc08sNz2xBV
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 15:41:41 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23KNodAj031009;
 Thu, 21 Apr 2022 05:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=8aFZksGQ9/YGtf7ZxmtOaT/B9pjd11sg1Fytor0Em78=;
 b=DL0oDy+ijq8xnacfR7llt+5MttAtbLLRtviQ8aE/Jz1c9WGsUtyf0G5+TsreCQnQ2zPh
 PhV434C4MvAWLl6MnborA1WwPkaBP/Yoy0oDQpjcUwaZ78rWkhGAsDEibnt9VOizkabw
 j2rW3cpbsoyyM2aweOu71tQOdJg5EKxrjHWtNo9VE+eRm5w6tP8aLgU5U2hnwbjcIue0
 PRr135JAg5tc3m+hMwkdFQ0RaoxSHnYjCA+/WTWjeKJ+DLQ3BdGfNh7o6W+4C42xJu8U
 FpEf2dVkTOr1a/cM/jtZazH/oR2kkpPOzGvxByBQ3/4tgLqZMUhoCO1XzBW/5nNv0jCi 3w== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3fjpkc9whk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 05:41:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxgbxy/B9NAF8LQ+Exxv/8M93ToR66rFGZH/RffJhXmOblvgYJ7sU03Tz5PTTrKrb9wiNTUW+rJgoH8lSR3hu6CYlkhqwkA/QVCKqDP2c0fk/ujFrMOnPuh6KH/qUM8bp4Y3wBRkRdopxeg3Cc7vCPGQeJmuN8tp/WtXlPDDWVtp9HXcU5Qsf10OEccXDiNdqs+JJu1ojSlwt/DRlFnqLc4DClQP4lt0qi62XXxpqKuGsz2yHbcDN38sdlQ0XqXBecbFU7Btz04nogKVMOrG0YaITWQJRVtRn/6dKaKI92Hc/hDN+PMRkXgKZFGbrdlLKoKOUS6Up1IjvAyHtUSD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aFZksGQ9/YGtf7ZxmtOaT/B9pjd11sg1Fytor0Em78=;
 b=KZ3NYm04JWuD+YAS3dfQy0Trqr3OowiUF1ZLiNKQW6HSEjI+YtPjFcsTSFPqTpqtmN7WEo+8iwe6hWBO6rnqk37Q25eUqGCYvzXFfq/iF/fJcKUlfZ21ezBEsBpn3YHy3dG+i5AUPubmcrWE7QUDJIHZr/3EzfzVi61+m9HbscSzvUFQLBjbkNF9ltnWO44xueuUmmxXkZQ7Fa4EfMTDhEeCrhRNOrZWkZCWDMP6VCaSJ71QwY/Qft2TzNWBzl7VGLDh8/FNykIlAjCP4Wk/DQdsAh5Ysh7m0kkhhyZjI2HUlQiOsrrDvWcrAVvqw2C+g5moop9x+0SzB7ufffOrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by SN6PR04MB3853.namprd04.prod.outlook.com (2603:10b6:805:44::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 05:41:34 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::9df7:c5d7:9aad:24f6]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::9df7:c5d7:9aad:24f6%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 05:41:33 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] arm/dts: Add Genesis3
 board
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] arm/dts: Add Genesis3
 board
Thread-Index: AQHYVUJ1arIjqoZnuESSdojSrzAGnw==
Date: Thu, 21 Apr 2022 05:41:33 +0000
Message-ID: <20220421054121.GA11809@packtop>
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
In-Reply-To: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e56d1033-6ada-4e68-f5e7-08da23599829
x-ms-traffictypediagnostic: SN6PR04MB3853:EE_
x-microsoft-antispam-prvs: <SN6PR04MB3853514C08343A87015AC153C3F49@SN6PR04MB3853.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hm88Bvnmwd/9VRfo01H4p8XZECxzjTCQCC7YmzN7F1UB9qcv4RFctyF738ZovXFfI0/YmPUP+EtJuEb4DE7ijQof983r5AVkdvLYyqONtKA23WdjgSW8UTRaveO8c8XOMNfK+Xt416kSAt0UZzcFaeG5P8ErAJ6P5hntFvXCQT4NcZ99nf9A+aDEep53Rin+JPBkySAaWM3Y5A98KvK55or9gHyDrli8dfd31mjBzNekbVVR5V0sLDnxRWyRcpMVLpbCD5fJoZ3Y8+cRwBLCfPH7CdKfY1hm5SW46y9YadKGyHQrfWX/11fXbuLUnngPgxc4eggWdExV62x4qV0iRQQ2kPMsfnw9SYzzhtzn6yVKDEXl+K4mJaoByKAnhJVmu9b2gsTZ7DBRqalrPR9WJ+Op4XVSRUTd/RSj+WcywM5jws0mMRVkuANCk4VcPj7Es0GuK/IUG0YkD75+UBRyxGofJhYm9eMO+7oEQKIQvvJI9Juha8QGhP1D5fiRv/TUWzsa+a0QYf5jVndgB+c0OYdLFIIk5D5bgtPYHWfXWRn6K9gf6rrtEQiFulmQgYhSNkmXfQ616Bg+DBJtQnasipKLMwmfzHnT9M6epXun9xZkenoCtlxfj/uHQmOpVTLzVGkk0pECDXIsSBG/8RQd5EsXKc3hs+zVtLCtt4hCC885JZ3us7r+BmRRlA503YAhX3/eXguqLLNkLj5pzp1TKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR04MB8002.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(8936002)(83380400001)(66446008)(64756008)(508600001)(66556008)(4326008)(26005)(33716001)(2906002)(66476007)(91956017)(8676002)(33656002)(316002)(38100700002)(122000001)(76116006)(5660300002)(6486002)(6506007)(6916009)(6512007)(9686003)(186003)(1076003)(71200400001)(66946007)(54906003)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ySrt3bcQ3nXLo3FDetq0qg30rsdaXMfG4QIp6ZTkIl3S2sSiljWE11iVcLU6?=
 =?us-ascii?Q?FL8VTXRx72RCNc8p3iYvSMBEWfxiFEmSqQ5QUeUmIm9SC/oMNNI5kgWhTVEm?=
 =?us-ascii?Q?GPp1+DCi9iK2MsEprq7d0pr3XBkGB5rcI5HbRoERS8UahqjredJF5GpxqMi+?=
 =?us-ascii?Q?bmzF3/ec/wSKiLQRrJup6wJADhGzo3Hm9DkI6TfBVeRLkoVj9CVyWDftW2s/?=
 =?us-ascii?Q?AJRFV/KiGrZvTTuJiQt9V4PZpk2yq5mWZrwZrpq0IGS0ySZ4dWp8OX+GkG4W?=
 =?us-ascii?Q?tZtPe3hqSVtWppp9Gpz+K/jbgtzerrXqe1/PyTMpH+dtptlG3DKhK52O5IGl?=
 =?us-ascii?Q?3UBm1E3bRzJvAiewp2trklJfr9Zp2Bxlm95MtaL+nS7GFjzzkyq+XMa7wJk0?=
 =?us-ascii?Q?xA/3SWVGxH+UaZMnAL1Yd6+HFcJddQMc7Ov4BWyYQfvfR8XvKpqERWVq///V?=
 =?us-ascii?Q?s71GsrkB/FwYE+fCThqBLhFuSVhaYjhqEpbeVgANIPkms/Oo5A3u0+K2Qv/Z?=
 =?us-ascii?Q?UYZybP70C5O2Vyx1GX4mJlRMj1iSwNYZj7fhWddGwj1WOqC4iVBWanoX6zoG?=
 =?us-ascii?Q?nLaCWRMdk9i1amqNnxyZx75imLYK4d5fh/vVThcgf9GJ3pbjavzRTD4OVgIy?=
 =?us-ascii?Q?EAkTw1QIAQkJ5zsxKM6ekJhvf20nKZMdb/NxYh0EJMo0P9eR74m5MtV4s/a6?=
 =?us-ascii?Q?5X8AJhHiTtuRZbejjOgB0RWWNLX7oNZezvo6CMhtzomnMn3sJqxE1pN+hIaG?=
 =?us-ascii?Q?ea5TEZXEQ7azNYwnTnJJzXO6t39UvVMgwnQalbRmt95YJUEMsux+zPPUhRdD?=
 =?us-ascii?Q?T802Cx7b6aSyO5c/L5EytGTHKp4KCUIX9J+RJIRGw/Vgam9PnLTpP990Pqja?=
 =?us-ascii?Q?9C9DvnSB1MnIoM+Udrh1MoyaJLqx19fSaEZjoyYJ8Y7rWxBOWkPKee7IUvB2?=
 =?us-ascii?Q?Uzj2pgcx/gJ1iorA3JnffC8cvt3OLxR/nRLuQdxbGWIKYDhg9srlpLLl/kUN?=
 =?us-ascii?Q?J6EpIpincUSCBEjYBQPpIinpSht73W08hEQKVFE+9fKnwg576ukmjw+Ge7Cv?=
 =?us-ascii?Q?vTohBUQM0OWgODnFvpp/9w2j3O9VICvXCxvPKmNXklQOrZ/nTVTSbR5e+z4s?=
 =?us-ascii?Q?lwo54y63CVjCED3C9D0YQ2qOYTcNI7zKNhMhbbugi2WolkitSNQpLca19nek?=
 =?us-ascii?Q?ZUCDHNDl05A8u63q+9A9J6YjKhLnT1bE0BA+ZspLkoZYHyFWnGqIvGxwxsLW?=
 =?us-ascii?Q?k864FulilAfQBuryK8o25fIwl0WHwdpVM5jF8pwvG4WQTk7a31oQJbLS7W2U?=
 =?us-ascii?Q?vcCm/onbqn2F442afmhbK+WTShqJeTuyk4FFt+FpJAqi2hluo/+IgP/bWnyW?=
 =?us-ascii?Q?1IqzCiuqLFxW0GV50f/xcmPghyL+uz2i1Uk6u6fqC9Go8lHB3k/yoW2XRmrd?=
 =?us-ascii?Q?v19yhk58wyw3Taewb1LV7cFMTd/fd6ymE2rTMWXmoypS6J6IBy5X+IizQvQf?=
 =?us-ascii?Q?LLLcN3+F6TSDQ67VIUUxVeD2kIm4qbXm5E5Kk2msFivcDkx5m5xHt7PYexfF?=
 =?us-ascii?Q?fbxiPQ+H+pg5Yp+smPld8cqJeAJBAfG7jTuvjYBzjb/qJx4wU691+llTw3Zn?=
 =?us-ascii?Q?8oXZePTWXZc1TLjodXHG0ZbANat32hZ6s5tJtDBg8kDQLQ7S5M1vRB2l6uAQ?=
 =?us-ascii?Q?7fATrpCSRDkggSgLXdZ3RAHC+eGrymZbEI/8d1+XwotjYSdDGsG5MuyZJYLR?=
 =?us-ascii?Q?KiFoDViOXbhe2k9bi00E7b5XrljJTiQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AAC96CD25B2F3648ADDD0029607DAAD0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56d1033-6ada-4e68-f5e7-08da23599829
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 05:41:33.7982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjYDAPmBqQWpBeQ66rR7c8onnqnxgD2AKx7hW2Eflu3iZ0KKgiaAjVGU0f8AvXLm1RaxsKiMPCqg1VBspryhTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3853
X-Proofpoint-GUID: zMoj3vGwd-BVy_6Q2Zqd1T9DiEnSS5B_
X-Proofpoint-ORIG-GUID: zMoj3vGwd-BVy_6Q2Zqd1T9DiEnSS5B_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_06,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210029
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
Cc: "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "takken@us.ibm.com" <takken@us.ibm.com>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 20, 2022 at 03:24:59AM PDT, Patrick Rudolph wrote:
>Add IBM Genesis3 board and devicetree source file.
>
>Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>---
> arch/arm/dts/Makefile                |  1 +
> arch/arm/dts/ibm-genesis3.dts        | 83 ++++++++++++++++++++++++++++
> arch/arm/mach-aspeed/ast2500/Kconfig | 11 ++++
> board/ibm/genesis3/Kconfig           | 13 +++++
> board/ibm/genesis3/Makefile          |  1 +
> board/ibm/genesis3/ibm_genesis3.c    |  5 ++
> include/configs/ibm_genesis3.h       | 19 +++++++
> 7 files changed, 133 insertions(+)
> create mode 100644 arch/arm/dts/ibm-genesis3.dts
> create mode 100644 board/ibm/genesis3/Kconfig
> create mode 100644 board/ibm/genesis3/Makefile
> create mode 100644 board/ibm/genesis3/ibm_genesis3.c
> create mode 100644 include/configs/ibm_genesis3.h
>
>diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>index a79f885f54..fae23e6bc1 100755
>--- a/arch/arm/dts/Makefile
>+++ b/arch/arm/dts/Makefile
>@@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) +=3D \
> dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	ast2400-evb.dtb \
> 	ast2500-evb.dtb \
>+	ibm-genesis3.dtb \

For consistency with the existing naming convention, maybe
ast2500-genesis3 instead of ibm-genesis3?

> 	ast2600a0-evb.dtb \
> 	ast2600a1-evb.dtb \
> 	ast2600-bletchley.dtb \
>diff --git a/arch/arm/dts/ibm-genesis3.dts b/arch/arm/dts/ibm-genesis3.dts
>new file mode 100644
>index 0000000000..ba610c9032
>--- /dev/null
>+++ b/arch/arm/dts/ibm-genesis3.dts
>@@ -0,0 +1,83 @@
>+/dts-v1/;
>+
>+#include "ast2500-u-boot.dtsi"
>+
>+/ {
>+        model =3D "IBM Genesis3";
>+        compatible =3D "ibm,genesis3", "aspeed,ast2500";

Whitespace looks off on these two lines (spaces instead of tabs).  Also,
I think most BMC compatible strings have a "-bmc" suffix, FWIW.

>+
>+	memory {
>+		device_type =3D "memory";
>+		reg =3D <0x80000000 0x20000000>;
>+	};
>+
>+	chosen {
>+		stdout-path =3D &uart5;
>+	};
>+
>+	aliases {
>+		spi0 =3D &fmc;
>+		ethernet0 =3D &mac0;
>+		ethernet1 =3D &mac1;
>+	};
>+};
>+
>+&uart5 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&sdrammc {
>+	clock-frequency =3D <400000000>;
>+};
>+
>+&wdt1 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&wdt2 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&wdt3 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&mac0 {
>+	status =3D "okay";
>+	phy-mode =3D "rgmii";
>+
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
>+};
>+
>+&mac1 {
>+	status =3D "okay";
>+	phy-mode =3D "rgmii";
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_mac2link_default &pinctrl_mdio2_default>;
>+};
>+
>+&fmc {
>+	status =3D "okay";
>+	timing-calibration-disabled;
>+	flash@0 {
>+		compatible =3D "spi-flash", "spansion,s25fl256l";
>+		status =3D "okay";
>+		spi-max-frequency =3D <50000000>;
>+		spi-tx-bus-width =3D <2>;
>+		spi-rx-bus-width =3D <2>;
>+	};
>+
>+	flash@1 {
>+                compatible =3D "spi-flash", "spansion,s25fl256l";
>+                status =3D "okay";
>+                spi-max-frequency =3D <50000000>;
>+                spi-tx-bus-width =3D <2>;
>+                spi-rx-bus-width =3D <2>;
>+        };

These lines appear to be space-indented again.

>+};
>+
>diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/a=
st2500/Kconfig
>index 4f992f442d..81c4fd0c2f 100644
>--- a/arch/arm/mach-aspeed/ast2500/Kconfig
>+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
>@@ -15,8 +15,19 @@ config TARGET_EVB_AST2500
> 	  It has 512M of RAM, 32M of SPI flash, two Ethernet ports,
> 	  4 Serial ports, 4 USB ports, VGA port, PCIe, SD card slot,
> 	  20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
>+
>+config TARGET_IBM_GENESIS3
>+	bool "IBM-Genesis3"
>+	help
>+	  IBM Genesis3 is an IBM evaluation board for Intel Xeon
>+	  and AST2500 BMC. It has 512M of RAM, 32M of SPI flash,
>+	  two Ethernet ports, 1 debug uart, 1 USB ports and 1 PCIe
>+	  port connected to the PCH.
>+	  It has support for JTAG, pinouts for 9 I2Cs and eSPI.

Might as well take out the line-break before the last sentence?

>+
> endchoice
>
> source "board/aspeed/evb_ast2500/Kconfig"
>+source "board/ibm/genesis3/Kconfig"
>
> endif
>diff --git a/board/ibm/genesis3/Kconfig b/board/ibm/genesis3/Kconfig
>new file mode 100644
>index 0000000000..09fe60262b
>--- /dev/null
>+++ b/board/ibm/genesis3/Kconfig
>@@ -0,0 +1,13 @@
>+if TARGET_IBM_GENESIS3
>+
>+config SYS_BOARD
>+	default "genesis3"
>+
>+config SYS_VENDOR
>+	default "ibm"
>+
>+config SYS_CONFIG_NAME
>+	string "board configuration name"
>+	default "ibm_genesis3"
>+
>+endif
>diff --git a/board/ibm/genesis3/Makefile b/board/ibm/genesis3/Makefile
>new file mode 100644
>index 0000000000..2bb8917fab
>--- /dev/null
>+++ b/board/ibm/genesis3/Makefile
>@@ -0,0 +1 @@
>+obj-y +=3D ibm_genesis3.o
>diff --git a/board/ibm/genesis3/ibm_genesis3.c b/board/ibm/genesis3/ibm_ge=
nesis3.c
>new file mode 100644
>index 0000000000..9de8531806
>--- /dev/null
>+++ b/board/ibm/genesis3/ibm_genesis3.c
>@@ -0,0 +1,5 @@
>+// SPDX-License-Identifier: GPL-2.0+
>+/*
>+ * Copyright (c) 2022 9elements GmbH
>+ */
>+#include <common.h>
>diff --git a/include/configs/ibm_genesis3.h b/include/configs/ibm_genesis3=
.h
>new file mode 100644
>index 0000000000..f40aeed8a9
>--- /dev/null
>+++ b/include/configs/ibm_genesis3.h
>@@ -0,0 +1,19 @@
>+/* SPDX-License-Identifier: GPL-2.0+ */
>+/*
>+ * Copyright 2022 9elements GmbH.
>+ */
>+
>+#ifndef __CONFIG_H
>+#define __CONFIG_H
>+
>+#include <configs/aspeed-common.h>
>+
>+#define CONFIG_SYS_MEMTEST_START	(CONFIG_SYS_SDRAM_BASE + 0x300000)
>+#define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + 0x5000000)
>+
>+#define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
>+
>+/* Memory Info */
>+#define CONFIG_SYS_LOAD_ADDR		0x83000000
>+
>+#endif	/* __CONFIG_H */
>--=20
>2.35.1
>=
