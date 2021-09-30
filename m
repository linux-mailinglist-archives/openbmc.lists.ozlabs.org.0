Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F81941D196
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 04:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKd095fBPz302d
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 12:45:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=C7rNJQ94;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=1907ce065f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=C7rNJQ94; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKczb4GRBz2ynL;
 Thu, 30 Sep 2021 12:45:13 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TJJOeJ029393; 
 Thu, 30 Sep 2021 02:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=uhDkxvvxlaAjjLHyXf9KuaX6+crgGPtBHl2rKhaI1+E=;
 b=C7rNJQ945dnxWgG2b6iwiCKYs1lFcbA/hyS2hIv73T1xsEtkd16c+i8i7mL4QsvC0kag
 gLQGmlfeA4fQlXFlzIbvqLDkaEGGGNvc0Ru4+X8xPeuMZTlRCV3chtJOpaGgp521AWSi
 vaIZBk4mHwd7LCvY/AGvI4t6Ii6VCqqNy+5R1+2gBrqrGbrizzcgHyPFBnllPNScqS5P
 KsYsD2s9RkQoyurwv88OfLpugNP9io1iLQ3rP79CeXiPj6RfhT+s0WlMXLpuUa6tHdF7
 mxvT63IS63cJ+sd7I37FJZ4JU4GwBEXTMJkmaKGmb9labrfFGbEaK3IyopI4fCJ+43nb VQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0b-00268f01.pphosted.com with ESMTP id 3bcx6vs30q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 02:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch4JSbRVF1qImF2eSGVDjMV6iu4SN1S3qDLVThrLvnk/ANQ9G5j1fnRLi0ZgL1281ItVzrhpxJY9a3PrrJVLSR3PxPC80k6VNJp5FWhkd/gkfV9AKQZbVjQ1ExULzzLb+jVs6NdcDzor1/IJQDIdKz2h9YV6HRNVGXjAbikRtalwg/UBFNDaXemzkDjxw+bXdwE8UXYb79grAPiOUzhvdbThqSQ9HJSN8f6YKqzTRPFjnHxZzNYy+4jOHZ2r6v3PZZ4hTGIGmk3Gc+R9Gtyv49JHPwMwyf9mgI7nUZs2KrPV6FFYb9GV19hQ9Z4OuTRzJfL4181v7XYK6hEsDqJmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uhDkxvvxlaAjjLHyXf9KuaX6+crgGPtBHl2rKhaI1+E=;
 b=BlF3LKSLLBxBjtgAWOUew+slvRfN+0mkxH/+BVi1Xe/rJG1s7O4ZckYnZe4JoZlzEJPii5RyrcjCEo7GaHco32IW9Se7wK4UWBPvfFAGQnPOgocVgiEKEWWxwhnZovDfFSbSE0JCwhVuAl6rBStiHzPx5QScRw5LPhmvX7fkUaVCj7t2Ptgy3+Kv9RnK2eqt+QB+7lo7ePMwSdhzK2jvjRSHnOKhbJMrBiMaG2OMn5ufe4BanRK2TyhwsBTA8p7hlulBT0KegEndf3HezswR9Gf5ZUabtJphNTm1+qMYze7+jpl6WdoS904qeW1B4tc7XPAprpipqPcmJQtL3iwkjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8135.namprd04.prod.outlook.com (2603:10b6:8:2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Thu, 30 Sep 2021 02:44:48 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4544.021; Thu, 30 Sep 2021
 02:44:48 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v4 0/4] i2c: aspeed: Add buffer and DMA modes support
Thread-Topic: [PATCH v4 0/4] i2c: aspeed: Add buffer and DMA modes support
Thread-Index: AQHXtaUi80ONMz2WSkW5UTjIcSKTPA==
Date: Thu, 30 Sep 2021 02:44:48 +0000
Message-ID: <20210930024448.GU17315@packtop>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bb2a2dc-8473-4ef7-1b60-08d983bc452c
x-ms-traffictypediagnostic: DM8PR04MB8135:
x-microsoft-antispam-prvs: <DM8PR04MB813504BA7754958A2A5FCB38C3AA9@DM8PR04MB8135.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KLhrUTBa7d/W9eImVG8tCjqWuvB9EwKQMANbx4GDDVicdNrzH90vijUMjP6yVvT6/hd09tcU8QyEXuqDgFiEluLNwywm3WoK1gqihAhpdAq3wzRPFTbSL7Pxb9/Vzg9ueVa/pY/lxKZailQ/b8RBaEgL1IF3udiYicw+c8vBr1qFq5ySPhjIH27gS30/zSZyMlAZFOAdMhLnW6ofy9gNxaOelBnNcsPnkPME56MYKAQhT89bSzROngDc689MROisiuofZkyZYymmKJ/vpuf/naxvR2kB4V4JA4LXNRAzkmWzKmreGfUbP0Mrix62OvVmxpzR2+SR1k8ZKXpMP8FKFiPlKWF2HWwZrMKe+Nxi8auqO7FcrPjfKcClOo6KWMuGtRH3K++OxKpKSAIZt8bLJGJAzyQZxuvXjmvm5HrPYJ4/BvJV5gBTmLr7WYzY9qe9gkr0p8yxz2O0UqfcHCCymcxeLniEy90DT/WVwzEzQF4lF9SLp1YaGpNL6iqoqpwek5K1VKH/QPxjPQ7Z/0qN5ZtGwmFQGRrXQ0WEjOx6gQcA9W+Gb9RhSFD6jJ25jT4vmBc1OQnITec3Hkb+Rd+Y/nTV0fqRuUccot2qEzb2aLSIX4By1ouH2GwwNY/3uFayaliknlPVLLTcJvrIPLb4vg8GTcAtVd0eI/n1IqZSsdI7NmpeYcS16gwmq7G+BgoVBFdpTa2crhRZbhQvN6Ku3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(9686003)(6512007)(6506007)(5660300002)(6916009)(4326008)(71200400001)(38100700002)(122000001)(38070700005)(83380400001)(186003)(86362001)(7416002)(2906002)(66446008)(64756008)(91956017)(76116006)(66946007)(66476007)(66556008)(8676002)(33716001)(1076003)(33656002)(316002)(54906003)(6486002)(8936002)(508600001)(26005)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cxcF061tZefS4AEUqTVXs9NiJWmMUT+0kgZGz3Tgx6cX2fjgmWU/TMalWSov?=
 =?us-ascii?Q?Pp2IyMR+cqHQRSUu7L7AnEDh51dLz3+NT+wenqg+UxEh2pOdU5K3rlEe3zZ5?=
 =?us-ascii?Q?20Jm4H8yYuJJJpGP/KhS1Yo+ZjfFGNCix++UCuJ+9lL94A76N763MWiK01Vc?=
 =?us-ascii?Q?ikMC6WJQGmLPAg/6gjss14BxmIonVAgmS+smluPAK1UeQMvXEvtzuKjfkbeq?=
 =?us-ascii?Q?p0pev5bq4v/w3tah+4mqDiXXqUpCv5t+ytlpJRq9RNAQVYnYQRFYqM8/lP2U?=
 =?us-ascii?Q?Js47Tur5ucwXKz5M6LxTt4QUKGdaozMhHoZafpK+3Tg1IiYGl/BwFW2f/vri?=
 =?us-ascii?Q?a6AkURMf9GR1EKSi9x29CNzWvhGqt28C42ng/vNXnwGeAItRpnlIBfuxKfbe?=
 =?us-ascii?Q?pT3zXbeMLdeH4xUxdK392+Aa5c2UAjV8hpbWrdLT4PbAhXVo7QmuqK1iwkjr?=
 =?us-ascii?Q?VoBBG4996pf5YKIaDh5wV3mXXs88ZbcTanW2DqChZ/qpw67tVTp1WN4Qx0bF?=
 =?us-ascii?Q?jWp6TIVa4ff3M9rxs7ab4d8bdwABn9fRY91Lbla8LDDg49S4hpmvjRF4MEhU?=
 =?us-ascii?Q?5joxPoLmx8n5UR/t5uupUs4o3jwvgJNsrFi2VOOlPnOwqUnMzVskG2JN+LPb?=
 =?us-ascii?Q?1gz72erhCaE1E1m+O8sTeZMRIDKC7FhIEVjuYnZ8KmWuzqXdLcufeiDKNbxd?=
 =?us-ascii?Q?FCzpnQnVAM5hiqv0hzh0vAfcmlu02ijhXIFakbIBsALTQvi5uavqxE8Q7fPW?=
 =?us-ascii?Q?i/opISxMELwYiY4SR04WOrF+6vO9G4oZ88OBNpEM3Vg5BDeoRFb31nPpaViP?=
 =?us-ascii?Q?XdUDY5Ko0wP+//T5Nr/ilg/1xRqIaeNFevyxPACNM3cp8gji2LG/au/MdwPD?=
 =?us-ascii?Q?Il6m3Jqwac0RFloJvH2ACqhTlAIWprRMhTsnpACQLo/60Hh8v9eB8QBjQ1T6?=
 =?us-ascii?Q?hcfRN9VyyEOj1yeSKkeANuuvjci8GonDZvtbjyvFBZ+WKpTuGnKQypja1Fb4?=
 =?us-ascii?Q?gxzCuLKi5YHlgo88tmr7WW8U/jpXSTPLvK1vEyH5FcZp5EwPY1AqcbTh+qB0?=
 =?us-ascii?Q?zV5/0TfNiZtpO5v+C1yNvimDCk29uCEkqdrWeVzszWyiIUke2i7P/JkJpftd?=
 =?us-ascii?Q?od5vhVtDsLLHxx5gEZdo6OC0t1GSuPXySORrFv2stQdOEv4Edoncl3OROrAr?=
 =?us-ascii?Q?+/1utbH0d/L9Qlv3O2sT0HbPMo8Bsxc9Cc555es6S4zeOn1YgkJ5PloPeTvP?=
 =?us-ascii?Q?OMG2wiut3JXZqr65U5EG6Bly8GTe3mvagZRJH4OLqmnAu7JYJH48huMJ0L6C?=
 =?us-ascii?Q?e4n+pmsOu4fpcav0YfhEIw8g?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <721798A469AE8E42ACFCABC8AF63E9EC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb2a2dc-8473-4ef7-1b60-08d983bc452c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 02:44:48.6388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7J2Np2gV8IVQO+UNf64mn4BgGGAh3hmjSDyIujnSv2HYoXeelCHV8OyO9/FYl+N4L024qk4oG91mm65M7y7hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8135
X-Proofpoint-ORIG-GUID: 2BIPmXWw85HqLk7Y0lwikBFAWHaagc5x
X-Proofpoint-GUID: 2BIPmXWw85HqLk7Y0lwikBFAWHaagc5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_01,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300014
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 11:17:16AM PST, Jae Hyun Yoo wrote:
>This patch series adds buffer mode and DMA mode transfer support for the
>Aspeed I2C driver. With this change, buffer mode and DMA mode can be
>selectively used depend on platform configuration.
>

Any updates on these patches?  They provide a welcome performance
improvement for some stuff I've been doing -- for the v4 series:

Tested-by: Zev Weiss <zweiss@equinix.com>
