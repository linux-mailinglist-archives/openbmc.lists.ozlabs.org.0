Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC68603080
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 18:06:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsJd23WGdz3cd2
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 03:06:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=bCOlQVHq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=prvs=029029cdaf=troy.miller@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=bCOlQVHq;
	dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsJcM6m1Sz3bsK
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 03:05:38 +1100 (AEDT)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IE1ee2023551
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 16:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps0720; bh=VwzyGFb+GoebgFbYQS6lAa7VouYP9xBquzYxvNexGdA=;
 b=bCOlQVHqsomPYi60uhg4MgAqi+6Z2a/590qHMqpbfZA42Pb+W82jl1VD04LvLZ5BAa14
 xAgI1jmCwvpQA7G5Gb5n2Qpmi1zHYOCjtdqkYsZ3xUUfvIhEGzr9xFdsmX+ZbgfT6ZAC
 Iv0cpjk4c8stvLiZgN7kWnEGEjS72tHFPWCnufB0g+O1P94T8eh8AOgzo1MAA9PwPLNN
 tkbb2Q7s9vnxWqxn97UBE2wAaSP5pZrVCLQkSP/VXyMtL9kgfkKfH3hxUdGjoV0OjDEK
 E0wDaasbFPrCfnQ44CMDipSl76E3MzFckkXpvCsVBv/Im77+l8lRcLTpXBtk55BhedX9 Hg== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3k9whuscb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 16:05:34 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 6510C29585
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 16:05:34 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 18 Oct 2022 04:04:18 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 18 Oct 2022 04:04:18 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Tue, 18 Oct 2022 04:04:18 -1200
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 18 Oct 2022 04:04:18 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh9SsDG2u/uPbYGTdbMSyYtM2cFG91yid4g/5ROoR/876gmQ+NWTOI3l1Hwb4y1kcOllZyAkSc0KUJW521exFXRAeX0w1pdgXa9MUGUjC/mt/XQ8CExlVZ3miXeLUh4l/kDzmMP194w/Zo6QfdNII1I1mQ2vh6smF99X53ctaSxssK4pahFU4X6GlLV6M0PnnQrGGpVpolLIFoKYoDvmE3C154CCEBcnSzFt2VjrCM4/rI2494rsbYmOtTWJFmk/te/JpIdSwzohUM+K4V8rYPX7ETjtoqNApHZjv/MKqhyaRB1sMnCk0PmsYE2e0MHWPhDmB6Jw2qcAxlIJMNcqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+AMAR7pmQ2Hen73+CwPlF5/VuZHm2/EXVXNFrfjdyw=;
 b=KuRjW179V14zwxdmZwieoNz4ROWfcc8EpVvFYeRQQwaNbuNkNTr5EY6AZPxtmTtJy2WJMhM5jntOwZgqkwAnJhcpbjM7Ot2xvW2QTVv1XDb3EX0ViQG0Gtd0inVFEKXW66tJySQB4xRBhdVRhdMw8TannE94MpuIFcPQOfVD23MzP/J/FuNwsPYj1/h083dHdoV49kmmk9ej8KdHsl6vZFque/Cgqo1qofg2W8eq3WJLXIynDIXLgFfM1+ev49pHTcM2zXmTsXDNWC937WZRhCeAL/5PcWIAqfYqDqNBOevW3H39IUcoFWmD7pp3uRjMVeF4Gx/9uDEAq/+Lx+pLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4d::11) by
 DM4PR84MB1517.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:48::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Tue, 18 Oct 2022 16:04:17 +0000
Received: from DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::849c:32e5:8fd2:11b]) by DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::849c:32e5:8fd2:11b%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 16:04:17 +0000
From: "Miller, Troy" <troy.miller@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Are there plans to merge up to Honister 3.4.4?
Thread-Topic: Are there plans to merge up to Honister 3.4.4?
Thread-Index: AdjjCxnhGZay0Kz9QWCe1lyLyMdM9Q==
Date: Tue, 18 Oct 2022 16:04:16 +0000
Message-ID: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1806:EE_|DM4PR84MB1517:EE_
x-ms-office365-filtering-correlation-id: 7f66e8cd-5e08-49b5-38f9-08dab12268bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ysq6pmcv8ePuiTAU/AVDNIFKUprfPFkkHNwuvT7i5LYqLuKxBfMca58iTgKOW/8SHTteHCfFRp0oDqQ1b2Fipv8Sl7bqxZHB0HBOXFuQJefXvP0LbGwaVGGjV5dVXKBMIQEB/wtvQNyRnGA+zfcRDmHJdM6lBw3Hx0ziMZ4rKSpJ2bakC5fAOguSZ3ghY280+u9EkZkeWl0AmFZK/1o+3qk8xy6E6fWIoRfa2MwFyDiJFLIZcJXxKdoihsh1Mp8IYciEmNAKtbT7o1I5yFSnv/QuPDi5EAcAh2ou2m57b5T0N9YIVTcHDkvE62yT0kO+4xrMx16jtJfyPF9cDE2yqYL/WXuLImun66K37zzNGnhkyS5IEw84jktfjRIgV54uMkFf0uQ3ni3TWuZdKZevRE4Wt4nQBP9IvGQEiYpNOgNShG8hzewC4Nx5TprYigPE9yDHw3opQBc0wel86+YxXIUEzG+gVFgzXNSS9Nt9Hwkw1FoqIRtalZDqbV1Pw/L8e5Y23WdUmXHxgjZPLG1YlfFPJ1wnGEW1cSBMPMaQs1ppa4X04h06fYvWc7+yqf/yFbYspwyTkgLdB3dNDIAxAe+2FNbKlyXoWqHXflWlktYHK3P57EDVu7oXZAHUl+ud0S7MPY0rp9ubHH16yMkOm9IWPp01bCvrLrIORU+02Hvb/55anlhi00YYW4wVcJkUFSMwNnIcp9fpPC6V681c2ZIS/aE3m+KNiUej3jurqNGvPpO+JjBQDSy+lfURE57MBpYbsg8BRPYFvOV5/ktqFU77B8Hv4Cy/5SHZAKql8bI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199015)(122000001)(966005)(478600001)(71200400001)(38100700002)(38070700005)(82960400001)(316002)(5660300002)(55016003)(8936002)(6506007)(41300700001)(6916009)(66446008)(76116006)(66946007)(8676002)(66556008)(66476007)(7696005)(26005)(2906002)(64756008)(86362001)(33656002)(9686003)(52536014)(186003)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wz/R6SLFm6Nqc8rzkFZpOXxzQ55l7knuWI9yezly473idljmu5lDGbZfBKf8?=
 =?us-ascii?Q?AhqtpTujEVgDHivbNBMDeX/ar2ziy4GUwcuyxJQJmIbMvkJfcutHfkdjmDGn?=
 =?us-ascii?Q?PcEBjUQU/YSrl3boyeyWkeP+S+EG1XbvGH0yWwT7KYef2IlXeI0eLQNkjVDb?=
 =?us-ascii?Q?HNjpfIkL16FvSfbxrHEwOm8HPypreolvnig/eLdZ2DcSlroF8brfp/a/kbr/?=
 =?us-ascii?Q?JlXeLZAQpo+V/5Ag+dIQSxbtbYFYrgroJkxeuGcYRvIaql8wbdQ1QyB3+eT/?=
 =?us-ascii?Q?+Ua0G61vJyL1ucbj+y6/L4Ek3XqShhbeM/z94ElETme4bE2YBeYIqbg4rffC?=
 =?us-ascii?Q?+LQXb5KsWBvjdTJQA3LKPnpvS2Kp/ERmxYJb/mUbxRr+sgRzGC2M9xFnb13p?=
 =?us-ascii?Q?6rZX467BrC4Z322DlS7174g4lUrCL18NFsTPtlJC22ZzctLU6gJSHLCrgOfz?=
 =?us-ascii?Q?hA82BdIYEzDhvOIx3dvhg+nesgFpw1IU1Om/OSN/p8juH/FWR96aaHFbN8zW?=
 =?us-ascii?Q?OjJDW3fZ8shFCtWn9/6OyoCJ/XAuM18XLsFvTwZ9y+OZXhCtiviASlC8DRDS?=
 =?us-ascii?Q?BdMX3GCQiMq0FDaZ6CYMVr8EM/Wmj7fqnUkU9g//0eRFX7ltjUNIcfGPNTLO?=
 =?us-ascii?Q?ZfMxmK8EeTrMxGm/C2gEnTrsRlGHeSpZ4FVA9egQAKpoyK5h+HVUV/3qlCOC?=
 =?us-ascii?Q?vnCi2O22vbbyJ67SHo4Si4qaCJo0lPNgFqlJ+QerHj1Z23DUGovS72j6Fac5?=
 =?us-ascii?Q?VeUTgfomsEV7WUwHX7QaPr3sohNHVwU1G6BMRijFRvR5IeO4XGyCqrygALR4?=
 =?us-ascii?Q?SRkPDAsKZOpszGL8XqAJy7ABnWx3MH2m/cUH+j+ZJTJuI7YBDNxlvhysdKuw?=
 =?us-ascii?Q?XWmaPXd5dgRmzPxhthyqhOL75BkZOh+idrI+uIk/v39NH5p+omcnigc85Xkm?=
 =?us-ascii?Q?ZcGypty3I8vJCx9qN3h2N7I/9eKSnmNGnihzvqWgIeW7SB97+GlXKt9VBm8M?=
 =?us-ascii?Q?sVN4cbs4g30CXtMlG1xOa1ZNFloYR0y4gAdD/XxtcRpC7pmTZ9qAyv2rTSEE?=
 =?us-ascii?Q?b9h1hehk1xNi4kRcO+BN4ZiEwTlX3wvcGXgx6piFR6mGxSzTKQOjUufRszky?=
 =?us-ascii?Q?HoUsoUbSbg1xnptNz9VOTonrVY+0KJkhkHoGXVsZCjqVNNRarZexnG3D+vYX?=
 =?us-ascii?Q?TDm29VcXwS7/UAk+bztG6Um5d7ajwXKpv8TgS+po+4EaRaKU+laxOb2rlwfi?=
 =?us-ascii?Q?3fHy4oysUVvgY3JdKYJeCWr7G9gdGaRNnbwrzOl3vmSlcu+Fo28vEaLMI95P?=
 =?us-ascii?Q?S6jdjurNv3lmZ04+geF4CeqzMZWsxHrgV5i2++HqylrHjcT+JekJJAKI6CFM?=
 =?us-ascii?Q?1gHAxSLVDK57Fh8+5rWT4LYV35Uyu0JEzvNDzyqG9YPd8FPbg0JaLa3y1R7M?=
 =?us-ascii?Q?RocXD61fR/MmSh2w6VqnG08LJhnWLpgjbjWRxjg9dwQs3+ycdz+98SIOF6fq?=
 =?us-ascii?Q?V6c44twxKfOuUCgZM2fwJVai/kjgIvTPxor3V2hDv/DzQtsaYGp4WWIiH1l9?=
 =?us-ascii?Q?xDaqA6mD7HSO5k01X9nH142xq6c9cjmJteXLnwtc?=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f66e8cd-5e08-49b5-38f9-08dab12268bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 16:04:17.0088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d4YaMf+wsBHgciexZqkKkoweIRlt3xqyTta5+JcNmpkC8r6WpunzgGZSXug28en2NMu0fB1fgOGssmkbY8FBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1517
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: ec-S3pe2CdpzgAtJfPugNmy8qQiLW7jG
X-Proofpoint-ORIG-GUID: ec-S3pe2CdpzgAtJfPugNmy8qQiLW7jG
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_06,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 mlxlogscore=718 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180092
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

The Yocto repo is showing 3.4.4:
    https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky.conf?=
h=3Dhonister#n3=20=20

OpenBMC is still at 3.4.3:
    https://github.com/openbmc/openbmc/blob/honister/poky/meta-poky/conf/di=
stro/poky.conf#L3

Thanks
Troy=20
