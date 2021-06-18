Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2043AD5F2
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 01:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6FXt10NCz3c2k
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 09:30:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=h7vXI6Uv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=7803e3c1e9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=h7vXI6Uv; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6FXX5hj0z30CZ;
 Sat, 19 Jun 2021 09:30:35 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15INSQKJ009525; Fri, 18 Jun 2021 23:30:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0a-00268f01.pphosted.com with ESMTP id 398r42afgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 23:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YloG/WAsWyrsToNlqMQhUyzUzXzmBSjD8fkZjBZW1IG/BBFvfAHi3BRFLJXRETxeZHJSd6g0R4RTzU0e71bHcbNlEy9fOUNl5uHmnbjVZZWB01YYuMxK/bw1/Lihl7IC7c0o1t2ZwSsOzSFZDgOUCCJJaxstrYHRTIFiORihUHEVnoQi4+B+rJBDl/n361oTgrM/QKwPkjRnVUhLzEDHX2zIROZfYuO3qfENvML023eyVx34bLF+lI4oYSgqowAiNxtmlrDAj7zOP4Ce88+1lfWBDkW0zxNhJFv3Xf6F0pVAom4QXo1rQYpBTzRNNCOz8I36r6MTO8km8PvsNL/ycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU2gQs7jRrzGDYphv6ME+ticUDg332LdbKkSsiokjMA=;
 b=ayXG0cJQqRbamruicx4ZO6nFU3Ec6lajcZ7pFz/OfaPsry7pwcTdTdkgCXkwGCSeToBpCBkcxYn81Fi9VDySorElJEMmaKGBgfiax+lh8lSGhkBe9w2kk2d87RoS0wTVIYgIo5J7CqSC1s2X5Tg2nZ6GPcHcipLO0GBqMN2INOPRshY+SjcUxte123YZJczgRY2utHsA480BF+T4YJuG449N2geHY56sTiVUifpmi6bL71XH0F2cejMjDFQa33CnSaR9pj2Jc4/n0W6k6eQ6Br3R2MB219OT9E8E6ZVCpJISjAHREtpd3GhLuim4d6H4ewweeAbSo5iFZ2tDOJZZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU2gQs7jRrzGDYphv6ME+ticUDg332LdbKkSsiokjMA=;
 b=h7vXI6Uv1gPPvwAJgpdwY/c4g3hBLtrH2xceDUTVuTukJv68+cFkxxawXzvHR3hM/LZNqy/QC1CuXKjA022/flzYZDdFRtxRyE6PBwpEFWgTWy4MLIuiDUvlJh1eyFefFrR5aURoTKKrMrJkOO5+8UdjsiPRK/OIWdpQYRFdXjQ=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6732.namprd04.prod.outlook.com (2603:10b6:5:1::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Fri, 18 Jun 2021 23:30:13 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4219.027; Fri, 18 Jun 2021
 23:30:13 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4 11/16] ipmi: kcs_bmc: Add serio adaptor
Thread-Topic: [PATCH v4 11/16] ipmi: kcs_bmc: Add serio adaptor
Thread-Index: AQHXZJnjCtcI+6c1UkiVQLPff6oAew==
Date: Fri, 18 Jun 2021 23:30:13 +0000
Message-ID: <20210618233012.GD9658@hatter>
References: <20210608104757.582199-1-andrew@aj.id.au>
 <20210608104757.582199-12-andrew@aj.id.au>
In-Reply-To: <20210608104757.582199-12-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7290dbcc-b93b-4cd7-9ffb-08d932b105bf
x-ms-traffictypediagnostic: DM6PR04MB6732:
x-microsoft-antispam-prvs: <DM6PR04MB6732C60559DE35CE3276E84DC30D9@DM6PR04MB6732.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2eSwJUbGe8937DtjPtZGnmNRaOTkAKoctIw/1B7FhSGIXKw+nPJFVzbmVCtHlHjxveu7UvoLad8y6aV79+/3Qr7Ce6ol2VyRJNX6kBx329Q4PcLBQC0GQt8n9GR1zTuAdYVUyxshug8TQAqLyPxIUyDhKAGcQEMFZZkk/Jl3odQhWiK5o/LoLnqk9iXxFLg4ovxXokzfb+pEcP6oMaxJpSCqXmI7p9w+SAf5UX2aIhupWXx5HTOB6nKnHEhsu/Kz813a7oOfAjaFOi1yAWDfmkAK0K+t5QtenbXHZvyo3YiY1oEJ/LEIgGV+VqfmqFVwpoJGnVZa4CEJcqCWahr0CW+GQeEYSWohu5+IJVV2HiGCrUEwNintiYhnsYwDC3Bwz/9PtQbxzayKFhRFMMWNhaageFNhoPeiA3zDsZSdvZsQlQhrIk2kIBaTOCG2pz/TN0dHU3HR/Wv/P6eMXu/SSEIhdZvqYdUjUuB+qWE0Q/JzKifA7LRJ/GB+Vi/o4C7UMT2jOALuT60jFKZDXRKKbIX6nd3ZxPBO8+ZtOd1PXkhnFyWmtpVtBJx8SPouo4sjq8eRgCG1RM6tU/XLO1pqj2O6SIgMFy92AxtH4Fz96qc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(1076003)(54906003)(66476007)(66446008)(64756008)(66556008)(86362001)(122000001)(38100700002)(316002)(66946007)(91956017)(76116006)(33656002)(2906002)(8936002)(71200400001)(6506007)(4744005)(33716001)(5660300002)(6916009)(478600001)(26005)(186003)(4326008)(7416002)(6486002)(9686003)(6512007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wLlVoZTi2nmpoaqObUFJngTyLhb+DTPJnqhr4u6xQSfgwYd+TGKfrMa42Xbw?=
 =?us-ascii?Q?9oO9rMqMI4KEyIteDjTPjzzfOrXbsNJoCEWJvpGfnXPwD2PkS//qow37MAmZ?=
 =?us-ascii?Q?o+6kAR/YbHQqfEA4OT/nJ9XpkT8rQWNospWrAMtZxLioZIe5V9HLbuWmmrvg?=
 =?us-ascii?Q?mgHKGgiVoknDqdg4+cUwS5vRMrRkWMQXAbLlpuDeu31PtP9qGVjRxd191YXh?=
 =?us-ascii?Q?d29+UwxXhlzhvV1i+Q6g47qgVHhIsGuFY3alocizflPREKQ3qHA1o47lEXJp?=
 =?us-ascii?Q?ysGT/VfQt1Gi1drA4rrjRsIOnQ5b9KBILeF7nS8mi7gJfMgYU0g6ShJk+RrQ?=
 =?us-ascii?Q?Ss4bsSBlOUTJmS35/QybsaPgqeenPiNPOlLqwyco+5xtNcOoERHtZf5GRwq2?=
 =?us-ascii?Q?jSWMWZn6ZhxF4iI7/UplTJDYd6r9ErS36YUeTfBHJknp7q8GMBZM82urWTPw?=
 =?us-ascii?Q?9hD9TZVr4FF6FiVayGymIbdd6LQV78u4XR5UZYRrM0vQsD1M1aYsjnI/e+ZV?=
 =?us-ascii?Q?Dn4nRtg/Exk/cMJQkraalJ6CrJkWOcEKr0bVrzrTPXOhjsnefo6n1HzMgcYN?=
 =?us-ascii?Q?1HDs+2JR8TArqCyLfx9V1Zf+uSy6dwbYLLvD10HntKgUw7J7ijuuoRYds6jJ?=
 =?us-ascii?Q?F4s/NjJp9bluP85JNcQi1ikJpEt4LXzY2XQ9rSDrj0F01ePXxF2ul43DiSzZ?=
 =?us-ascii?Q?Q49D7VLkDxfmp/mQw3nqk/1ZZP3ZCOsV2weB6zQihKGUugYartdYwdh9sJCK?=
 =?us-ascii?Q?V7rNEUItxGq2g12e3VmiyKSofcpXYchSBZhuSvK+z2IB1LEM/JiD8f89lMH1?=
 =?us-ascii?Q?t8KxH948XO0cgWvkbkgMxeA8M+8KRaLYeI5RqJh0gB0Emq/Nfs/Chm1ixBQf?=
 =?us-ascii?Q?5pKe2xHpJjaEe/fG5fbF3+Yq9Ux0uOAWTUAJeo10J8lgDzKq9nuNsTK995UB?=
 =?us-ascii?Q?nIEegJ9/Sffs3Yy+U+TDyptc0S7krn6FCgTMTi62iEJ+CLT+If0C8CVy4XPV?=
 =?us-ascii?Q?85zmOGcCX0g8lRLB1P4Lt+plcAX5wD658bVe0cZN1YZuHztnC8PgDOiitq4j?=
 =?us-ascii?Q?YGKe5O74ZILJ0EdV1YAnkKKN7M1yBkiROVu7pmxnTCAMHDzuBr17J8dt01Zr?=
 =?us-ascii?Q?xaRnOqpooAF8w6TzuO/ZjV7XeFNhq+xBPP9RQ/quUCZcISrJOSNoOPM5WQhx?=
 =?us-ascii?Q?6zBvAk9shhDa181CbBUF2qLOyY6kLPz8myJRFAFQrffuL/1zxEAPRNmr/R6E?=
 =?us-ascii?Q?l/FLzQNAb3j7aFnih8IOhWLvxYFI7aOiJexmIcm3DwnHoHSwr39V6jDNT/3d?=
 =?us-ascii?Q?0DlXMqhTh89bEsy1Vj4JBCR4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C7CA56F6280F64E8D353493A56DCA13@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7290dbcc-b93b-4cd7-9ffb-08d932b105bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 23:30:13.5810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hu4g4tA65HooJ9eXtlPTnRg2qYgN0RxQqG6vJLO2nwFBUBAbCm1wfbmy6sYyXb5E9/dERBRE9uYuanm7isy0UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6732
X-Proofpoint-ORIG-GUID: 5yjc8PaMATy4AdprkR739qDMudB5yGED
X-Proofpoint-GUID: 5yjc8PaMATy4AdprkR739qDMudB5yGED
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_12:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180137
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
 "minyard@acm.org" <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 05:47:52AM CDT, Andrew Jeffery wrote:
>kcs_bmc_serio acts as a bridge between the KCS drivers in the IPMI
>subsystem and the existing userspace interfaces available through the
>serio subsystem. This is useful when userspace would like to make use of
>the BMC KCS devices for purposes that aren't IPMI.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/Kconfig         |  14 +++
> drivers/char/ipmi/Makefile        |   1 +
> drivers/char/ipmi/kcs_bmc_serio.c | 157 ++++++++++++++++++++++++++++++
> 3 files changed, 172 insertions(+)
> create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c
>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
