Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7C38C092
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 09:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmdK22TC2z2xtv
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 17:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=Qfx7Kah1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=6775408355=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=Qfx7Kah1; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmdJf56HYz2yY8;
 Fri, 21 May 2021 17:19:13 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L7IFEl006393; Fri, 21 May 2021 07:18:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-00268f01.pphosted.com with ESMTP id 38p2purt87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9btb7zIUIkshcJXHTm+T4J0SxsmMIH8Oz1VSJqaVp+xKDrMxLswzdqKbMvkzjUhr7+D5CyzZVLzZC7VMWwhSsdOAOT6mnZ1c6Vy4ZAyr+ndRQlCMlolOmt5HCMFtcqS1jKa/GoUzLQT+2YYaWqrDq3lJQeZwBD/G6PGwreW/u36EbqbQaoyrZhYJ8DZg8NHhOlkugARaUekBHzaJUSoWF5t1EbJvYMyzWvgatrBLvJEEJKpZGdYwI1ctuJzNkGoUprYncX2eIcE3u48mjBCsUhR10+hW0ohtGLeUvJGqFiObvrvPqTGfJRwtXuDgiBXg050eb2pYbNHzDkcLksP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NuUn9G9ftrZgTaJlzJCJVoGiK3YT5HJ4xBGnps7U7A=;
 b=F/eBJWEaNjMupZQCU1lEagd6iSEfj/1D3WT0BLZ1gVmdFnH8Mc9mFAOFxyUzPoMOCJoqmr8TWF4E8zknid3k4tbdkch0qiOnho0LVPyQcfkTu5ymPJPtGfoO72JNuB3Dc6x5DGWwmbjM9tvVyatiaiYtYK6DlmqnH2HHBvE42AR4ChSVDEN8m8z+YQvJA3RWDRq53Rku3G3szNwc0F+yHqsiqYeEqmbXlaqkfBpfvQwXjbXG9gkEUuFepNBTwe2jyJPOqPXRbHZ/fybf66d+0CEFnSAkfgJFaq3ac5afqYyLmQx2WtmKieh1Nglr+GuYgtHLcdoPBsa7DgcT/KqfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NuUn9G9ftrZgTaJlzJCJVoGiK3YT5HJ4xBGnps7U7A=;
 b=Qfx7Kah16C7Q5J/m3keJq/HZabyqqrjaKn7ujZLVRcJRII6Q06PqJR6yEdamjIk/f5DUZ0yixq5bNqL47S9UgezsHeeMN9j0hZk4pgSguux858uJeW4NA/2fPZpdXv/bndls3OG9iO8NrAxoDb5pWEpBpOcDrMjgDp6T0TxjHy0=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3802.namprd04.prod.outlook.com (2603:10b6:5:ac::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 07:18:43 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:18:43 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 07/16] ipmi: kcs_bmc: Strip private client data from
 struct kcs_bmc
Thread-Topic: [PATCH v3 07/16] ipmi: kcs_bmc: Strip private client data from
 struct kcs_bmc
Thread-Index: AQHXThGHS2huPU27DEiEXqeORqWM0g==
Date: Fri, 21 May 2021 07:18:43 +0000
Message-ID: <YKde0k1UCZacJFc6@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-8-andrew@aj.id.au>
In-Reply-To: <20210510054213.1610760-8-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a3ead3a-3a79-4fb1-00a5-08d91c28aa60
x-ms-traffictypediagnostic: DM6PR04MB3802:
x-microsoft-antispam-prvs: <DM6PR04MB38023A9ED8487474E02504C2C3299@DM6PR04MB3802.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KVd9cMUlnkI2n79PJpr7O8OIk+gVxPzfw93CS/NjsOFyQRYQHHW0eGF85Qw0gf5X6UL4YDPKeSr9XR/VxPf7DYH5bPpDwsNJynhmpBtLzyfP+SOlDTVev8I1PBKBzMzFWE8oS/Pag2N7NYZnpqsbzC3zHhUlDYL86Wefl8gTRFiOqsK79XfN1BPAEWCOkm4DfHdHYuS1/ad11RxxNIaBgEFbuZwsblk+OfAkWtqZjvymfVv28FV0OwHvGG91jAEYFml/4IaTotC7xFLY6Dy/wSZeaJrtBFG7hVUlcdL9UVmILsHgDS+7wub2/sy8lRLhA3mrfruOCmuwgyvyo46vtMk229L7n3HzA4H3yuOQNJ8VHhy3JhMxu0NQ5dj0R3aOXUuQrmKFeTWGrRGE5OZ14o+HSDYQHC+XY5nY1vkEAs/MhOZB0juQJyifzvbxvMUtBFlsnTvSyPkahLhqqt7E0Slzcr5sEIbVI4N54i3c1l5p743PwCDguoW7Aw6fsKWE6L+SmeGS5U3HFWUe6doCyOp8oiQ1Hp3mtucWpHShNkO0TsuLse6eQpjiKIE/GzIG6b8odHv/qIkZHKeFww4bSrekQxz8vejFCKL8joO/sVI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(122000001)(5660300002)(7416002)(478600001)(33716001)(38100700002)(71200400001)(26005)(54906003)(66476007)(66446008)(76116006)(66946007)(8676002)(4326008)(8936002)(6916009)(9686003)(6486002)(2906002)(64756008)(6512007)(186003)(6506007)(86362001)(66556008)(316002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?V3y3dXLajnbq1hd9Qyb1MaDGYsMjAhgYws8t4s3YjNSuFkjQQZrW6BuqOD8l?=
 =?us-ascii?Q?ubDS9fsxpIdvZpV5mnvYXXAg/31SnZkgUguyLMZBHuSXaphEbFwY7BIIGybi?=
 =?us-ascii?Q?wayYWigGoVb7eJMvupE+C/XghtHJuy6ROl/bQMttA93r4zjKPTBorIe31wwH?=
 =?us-ascii?Q?3vY4whoLFVy2oZON4fhRUH1qugmQj+VxYnEo1PGP0MNOgITP13fdD77TqJfg?=
 =?us-ascii?Q?QKEOx/0uw5XeerQo9H5SUSZDJ3EgT4CB/WXyDFvsbxwNDGoCSOqGu8MRSO4X?=
 =?us-ascii?Q?XZjdOLxBG7hVo6ZrK0+vfzK5afFhxwy3X/k4J4/RaQB4+A9d/a//bfEYR5CH?=
 =?us-ascii?Q?GOJsKc860xO+TlP0QZX1Og6zfHKTicqekpissf3s7n+faDCJVYAB5Lr8JXzd?=
 =?us-ascii?Q?wqyX3cEKxh4wBg/+AXn3MQ1zp3inzujK6FVJWpEs+UNQK2EfS4srB+fg/1HY?=
 =?us-ascii?Q?Yc+hbJY3VtQxjDPNccoMnNQkRK5yn4xrUnF8gu63iBUFYaBWavOJ12MR/xHQ?=
 =?us-ascii?Q?stqcw22GPT8hRLY41r9drUAlfC79tC6IIVm+Uu6/eRKj1KxgKO8TmPZvu0Ks?=
 =?us-ascii?Q?8IJxEECT/Yaeo5eNCk/feLigV+QS8qrS3mfxsB+WLGx4VFHIvBebj2t/Kb4r?=
 =?us-ascii?Q?+hU3FnDj3T9NUM4FX2NfMSLt3IBb+7oRTJAAIwNLmT670CDBN9/YoKvxgDA2?=
 =?us-ascii?Q?LUITvJpWxXM8GPSUd8x0U48fkVQvTP3grdGlv+ehPkoHizHcAa5Wcxe9WNdt?=
 =?us-ascii?Q?mMy6lg7A35u+0lQSCmSRP0wIQMGM0E6US7vR2S1wY00RvwQUhAa5z2/N8TMR?=
 =?us-ascii?Q?gwPyYrDx1axLAakSqUmlQILVU7Nul9EkGAjCRUEg2raC83B8eClk4q6xDpTE?=
 =?us-ascii?Q?xPSnEFH7eK7rOxk/oMW34ZhGdOBUVO4Kl9lOV2DMliKd8OsOmvzT4OLcrosa?=
 =?us-ascii?Q?rNLNFa7l4j2WJJrlRaHYQqGUpytTLm/gzzWjOW9Jd0n8KWPlAm9rhZW2Njs3?=
 =?us-ascii?Q?JmhKijvqqYdqGvfO6JUqX0Gx657UPnLPNmoe4QbXThAMD2Buu/VogBNTB5Dr?=
 =?us-ascii?Q?dJgT091/pNGMfzRqFpF5tHQsIHnGoU/5OV4gwduZAlqo1iRKNArvfmC/FWtk?=
 =?us-ascii?Q?CrT/wFAWOYoNRYfSMpwGP3OGN8fiIo4F2NAxBvltV/Px9MxVvtscfVyk7Xr5?=
 =?us-ascii?Q?EqR34pxNx9SBOv+6VGPRRM721BGgPmm+loLP89NSl/bGItHw0QlV8F9d/dHY?=
 =?us-ascii?Q?Ym+VooT4sAMTjittcOyg6O0PrrP4eJeOumi1HrodxNoqGLlURgChT4Mbk+Uq?=
 =?us-ascii?Q?jAttueppw/BDW65jYRcnfMjZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13BFD1E750047B44AEDC6FB517ACF727@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3ead3a-3a79-4fb1-00a5-08d91c28aa60
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:18:43.0664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/XpwBQk56+Tn+gsgM7FtikWntaTp3OK7CTPJKmcMXzVzopn5wAXhjXTvjSA7fInFIbO9qXIUfon0qKql9rizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3802
X-Proofpoint-GUID: xkDcA4KGWUSghhLvy1GUy2xHEgQNYrd7
X-Proofpoint-ORIG-GUID: xkDcA4KGWUSghhLvy1GUy2xHEgQNYrd7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=729 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210046
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

On Mon, May 10, 2021 at 12:42:04AM CDT, Andrew Jeffery wrote:
>Move all client-private data out of `struct kcs_bmc` into the KCS client
>implementation.
>
>With this change the KCS BMC core code now only concerns itself with
>abstract `struct kcs_bmc` and `struct kcs_bmc_client` types, achieving
>expected separation of concerns. Further, the change clears the path for
>implementation of alternative userspace interfaces.
>
>The chardev data-structures are rearranged in the same manner applied to
>the KCS device driver data-structures in an earlier patch - `struct
>kcs_bmc_client` is embedded in the client's private data and we exploit
>container_of() to translate as required.
>
>Finally, now that it is free of client data, `struct kcs_bmc` is renamed
>to `struct kcs_bmc_device` to contrast `struct kcs_bmc_client`.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
