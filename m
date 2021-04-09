Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF3359495
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmxx33rcz3bTC
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:33:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=eqkPTNZd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=eqkPTNZd; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmxc5s9Xz2ysq;
 Fri,  9 Apr 2021 15:33:07 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1395SjCa005078; Fri, 9 Apr 2021 05:32:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0b-00268f01.pphosted.com with ESMTP id 37te8n8bax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOk96tCJCr9W5c3DSyPlJav4zQ6oUZW+0TUjxpMEy3ArKLPDcD8jn/24KU91GoITUEaIClLTMHmq3oliDxRSoDuy6Isxxs41E94iwTskcMhMOoFeKMnXyEVgF9xinb/ycZTXhBcn+N7LPlANiGQhDNigNTMcIDOCTRWmsfyPnApnbstkg2dRfvqluj8w0L6cKRwSrakj/Y2pRk5IxTg7Q6AMqQstkjrM39/H/IswDwfLVfAqdBHL5o/PpexH5x+nQFMA6U34PeCpPW04zsnYfKDPKoU9uwtinRzIs+rJIfv/jhvWniciwAeI9QgMEVkjLdr2/mjiR/c6j4D7fvf4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdZxGJbih6o1kf8YTQQdGl8jbmLjoRw6kNolxb80EOY=;
 b=FT9NS5QYn1jKpzeEce2CQeyFV6EYeecJG1iM8W+MmSiScw8YeVVdsUZZGqIr4bt3cWjsHtN47MDUuXxD5PxBiPu3S5IV4rI5+ke+hRS+HVugXSqwTW64Wei6NXMNjyjJnMrWineR80W93iDT3NETsE2e2IFP/tGaqFfrZKhsgxevtUUsM8+LfxM5VnFX0FLfNRrj5TdP8r/YicPwnLmVH3u/mGkAs8QCuxiB8c0JU8vFyK4l+GLLWmy3DOwn1OwcPNhxchR8tFjgIw2RKj4YE2ibuiTwIPhWhxqQE5+x7ihyiDVVJBLmu1xnHGB/Hfcx13KG2Zy1I5S2vnIhaFOMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdZxGJbih6o1kf8YTQQdGl8jbmLjoRw6kNolxb80EOY=;
 b=eqkPTNZdQCJq8B+9rvL8mMIaCmargGluvzNRfXq7/vt1JVdNq7PHHb7Oge3d6flFa5nseql5/k18dPxZMyS9rjqCaA8C+MLViTh9QMBKOdz3a41s/SjS8ksvgwLa/bilHOSXunCP8s/Oyt6ey7zN88mR9fb4ATYpj/A2pgRyPzg=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB1036.namprd04.prod.outlook.com (2603:10b6:4:45::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.20; Fri, 9 Apr 2021 05:32:01 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 05:32:01 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 07/21] ipmi: kcs_bmc: Make status update atomic
Thread-Topic: [PATCH v2 07/21] ipmi: kcs_bmc: Make status update atomic
Thread-Index: AQHXLQGq4crAoraGi029WOpfJ0Hr5g==
Date: Fri, 9 Apr 2021 05:32:01 +0000
Message-ID: <YG/m0Hh4BRGRnm7u@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-7-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-7-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16937c66-a2a1-48c8-372b-08d8fb18cd3f
x-ms-traffictypediagnostic: DM5PR04MB1036:
x-microsoft-antispam-prvs: <DM5PR04MB103691E0873530C28363C412C3739@DM5PR04MB1036.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w3dLdqOdF0iXSupXSmf6pIJfbUQyA6dhKsg7J1wpSkijqfSJ/Hi2CIeRL+Leom5UhGOmAj6ZAFoS38l+XOVGaWCLKA24ZbNY+5q26clOgdvcf5VoXcYxKH6fvqNMKpXsjWEgNWjX6m15+0uuehYhe8TUJtqnLTNTR1zqweSVWioSdniMrX2jba/rFirq+/EWjx9cArxcfrrgl+ews5Vhi1dN2J9CmM/X4OoF84EhTLwHRtFb70W3fpJF3TlYYkCW7OVVXrYifFocVh4EcBUaj8Xgu542/oUV8l+t+8tOGVC5+aSEHTKzjc6OzsMs4J2836gBmI3lcSLX7IROT1K3MKKU0U3XbqOs1TygyTRUmRVioceuJvnxzKUh9wVu8GjY1MzsbAZUCXVnNFuQetrw5umk1IXHshlijkh71H9iqE5izX/LTqopgA8xYuv/2gzyaGy3U5MtC7VjQYkIOUwXTdpt9UfOzsbmy5POJS6LQGkEypUw2SifMCbB2PylpVjlNXH6W1voxb4gW+uQdwDT34noXVB7Mo2l0Z5noCKTLCvv/nwzezHCsukQ8mrjQkba+S5iMP8orafvad0YyfPPAQ84F0jfCyo/Wvdj4/ttxpcnsQff0DQ/0YuzgzsiJl5ng6csYk7R8Ycv+VkdthUMpu2SqPnClctpQBH70Yko/fI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(71200400001)(6506007)(26005)(2906002)(186003)(9686003)(4326008)(6486002)(6512007)(8936002)(76116006)(66476007)(6916009)(316002)(66556008)(5660300002)(8676002)(66946007)(64756008)(54906003)(86362001)(66446008)(38100700001)(33716001)(478600001)(4744005)(7416002)(83380400001)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eB8tmsaf2HwnezD7fZCPAfdUdKcKVt+UKVbxFETfIOHaTSIBhFuUJIsyMOj+?=
 =?us-ascii?Q?X7jkZkrRnuoj0h2bwfaO+enlyDqeHgGRm+km0jt+TG2F7A6QaKr1/ynbh8Tn?=
 =?us-ascii?Q?SS1k0L+6htPbfJB+tJCPaJ0nuiPYid73muWDXxIxmLrY/ZDG3g79+54zdYmU?=
 =?us-ascii?Q?ge6D78iJMI1U4suO/EI9GktsbwHqubMYjhpyU8TQ0XFRFy6ZokE9zGmynJVW?=
 =?us-ascii?Q?FjMeOXQtjy83MUVp9jOV4ESyzmW0YhqqtvvSTzBbmR8RoSmB44LviLX7IGXg?=
 =?us-ascii?Q?wmIJz6z3UI/6UaxcMnXvd9x6z4+YpFkNmxy2aT3VY2kxQrEYdLGVAgNmTqM4?=
 =?us-ascii?Q?N/TmAsgS9OXnUbeMLP7UGRfQrLgfwYYjri6UCXFrMoD8/MoiGYgxBCwN1dHR?=
 =?us-ascii?Q?RiBSXAunaYFPK5IfWhc4XZ9nlzLx0L9UNoFgWqUeuEAGbnRkDdigzWsWLIzu?=
 =?us-ascii?Q?tUHYt0ZAVcmuxdTmcoFcQQo37d8e44FztqxwRni+KPMasHQobpnqT6a4Xm5g?=
 =?us-ascii?Q?KHv1K+OReq7isxQLZy3qTGf2enICxcMoOZ7rsrx7kXq3LEkBMeXXS1IkfDh+?=
 =?us-ascii?Q?NzX7yjegagXcFpia0V0Z1j6dQKCEJbXmP7ym9WqfivgNbqyvEYvxSKudFw3z?=
 =?us-ascii?Q?PZepG6Q245bSj6myFCCJvgew6CcRoVcXOA6n/glSoUCVxKLDgbWRYyOj7MQH?=
 =?us-ascii?Q?P1g0oSE37bXasE16wvQokwKAUIEDBU1ywPG46ZuBDRWAn8sVjDUfth1BLJxI?=
 =?us-ascii?Q?nRdVvKbApOjZEufNCYHMtyCXASrIqPBvKBd7I0m+ZkW3jCn3gtmJmQZkjCU+?=
 =?us-ascii?Q?uM4nozNCXfdsId6MLA220JeYAz3lquLSDQ/YFH4vZScSzFswh/me3jxY3Q2R?=
 =?us-ascii?Q?z/mv12MQlJHnFoooSElgWscQtaxi7jQOVN53mG2BcdtKuEKjE85Mzpe4M+2m?=
 =?us-ascii?Q?YgoeJUZctgQO1dJOTL59lvsSQqG5F3K0G/qpZvChnVJ2hwym5pVsTFsqlgCa?=
 =?us-ascii?Q?Et8Tmr1lU2f8ZhSonQEFxjQNuNYSPNuuatIgsBctLpwlNExp0LWsYE5chiwy?=
 =?us-ascii?Q?Lh3CroGd6yM5wAfg2EqXkhkuBjSI+PWxUn6OQoxGPywPzI17tjF6PASTF05V?=
 =?us-ascii?Q?jIgN9SGtLQObQkO7LpiOMOWvfesPUcsbIIf0ZRGQHoaltoYptX6Ruc3JKk52?=
 =?us-ascii?Q?PuUSiJS+W+RWPzn/plUcFUyduvcIFNM8p0WtZFlV4nrXEXx3o9/ugpmgjQCd?=
 =?us-ascii?Q?e7bAXCSQqLHAmVWiRPdQcDIGo73xqFVwfycOq4R107PnvUWsjeM/vcrEw9v6?=
 =?us-ascii?Q?5jqbZ9UJEY3EMeaPT8oAOfve5ZqjAI4TXKsirlxruKjrfw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <123FDB90147CAF478A030F953C79B5FC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16937c66-a2a1-48c8-372b-08d8fb18cd3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:32:01.3394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1YsdW1ezjj6QSKkDz2xHKPBaNdB9SZwvy2cV/9eVmG4vC5B+UzFWVgMzTtLUfEGMn/hPRQAwVhFhyDo+AQBmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1036
X-Proofpoint-GUID: DubrzYeD83XtuOF6seDfwIwlboBIu4nZ
X-Proofpoint-ORIG-GUID: DubrzYeD83XtuOF6seDfwIwlboBIu4nZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=659 clxscore=1015 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090040
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:27:38AM CDT, Andrew Jeffery wrote:
>Enable more efficient implementation of read-modify-write sequences.
>Both device drivers for the KCS BMC stack use regmaps. The new callback
>allows us to exploit regmap_update_bits().
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
