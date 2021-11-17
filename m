Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5250F453F30
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 04:57:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv8K50zdJz2yQC
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 14:57:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=FAsqXrvo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=295534784e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=FAsqXrvo; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv8Jc4H4sz2xXs
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 14:57:19 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGM75X7001926;
 Wed, 17 Nov 2021 03:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=OnBoLIinA8ZVcUKyo3aWjXcXPaIDQc05MLobH4FB3HI=;
 b=FAsqXrvo0VGTebxN3L60qvcwRIlinB+Lr0czVU/eTmdXylLKeAYJMbV+D2i+SJUu2fGz
 3kTg0R2i+Y1Pfx6hGwicmd0NjJJZpyFDPbPxcdWDiWqgNB5Z4ahP9xPdUhuDFeNfOnJP
 WxxDjMNn/9CNoCoshvzeNrXEDsnj0tz0e46m4qY1d97oeEUuizzN0OMw3iBeNXw2mD+r
 707sXmXjvpRzBrnhsnVDyDjjUk3aqi6LEHzIfxOQXeujO4IuVBJXyF+N8c4TCD5Zv4fP
 5bu1OEEy0pogOejp9XObLgla8/yjNrHPGdc0C1nj63G/ep75vYRPu1J8HqDPZxZjkdxo ng== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3cck9199bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 03:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cos66wkYXCAftbWuu4ugM9VU8bXnXUvVNX9VBpiLduAtMYMn56zQTjQDAgH8z7vyfQOHvwmt3YM37FKpr0oSLfJ6oFAHBkMVSaBwCv1W+J78p1jxtLHprIoitErj7GZs2zVtkBl0/S+X3kRZGdFp8yptqTaTEcqukitzKBVlJEFzXeqBT/CQ42+X6ylW/9aQBGE8SciwlUJe/4uoMp2DPz0p9wUahAaehnlP1KyJe/Lq/SYPVv5gw4mmyjb5GuDUztBUfrVxRRVhpolG//p0GamPiYUbibPZCPBV8UuEzdZMZzDsOhte8mdKnhaNDX5ed4VHrB8xWvS96tups5ruhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnBoLIinA8ZVcUKyo3aWjXcXPaIDQc05MLobH4FB3HI=;
 b=iqnS4AaD+MB4RYKUPmtHfRBr2aJPEBaqvHgJgxmWMB2Y2dUDSFbMs5eX/zQYGeFr5H9WOhqoS1rD5x2GUzfWBt8n/t+7mhugRtmhM7u4TZLmD1HIsqVqEbmIgPha53SF2qmkstN5BKTEPSf9U92PnhU3Ybgidxn1SqwL3oEvlcXC/zTbZ4+FRzCpjoeuRn10HZo+uJI51IICgH8A4/magQ8eF0hGf37NNCKTeLlcjoNIHgfuIJ/+YR48XOKtb8ONZJpUtP3kA5G4hulGIAKz8dNeE4wQN4KVmbLnjDjW3Bayt0ehX4/5Q/vfI8ZIH0K/9JdBz3kM0nfjQ1ZbLSEA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7894.namprd04.prod.outlook.com (2603:10b6:8:26::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 03:56:43 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9%9]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 03:56:43 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v3 00/13] Introduce PECI subsystem
Thread-Topic: [PATCH v3 00/13] Introduce PECI subsystem
Thread-Index: AQHX22ciodUE7zq1ukuEx2RIl/cSbg==
Date: Wed, 17 Nov 2021 03:56:43 +0000
Message-ID: <20211117035642.GH14774@packtop>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
In-Reply-To: <20211115182552.3830849-1-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 822b1a9e-340f-473c-0c60-08d9a97e44ad
x-ms-traffictypediagnostic: DM8PR04MB7894:
x-microsoft-antispam-prvs: <DM8PR04MB789493CDBD87577E07CC3AC1C39A9@DM8PR04MB7894.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DDp9cIP+72FdsUGuCoH2HR1mxLFF4jvgb83eBFWeAwAcw7QjW+DvvGOORDMrd+RXTx9aJAMBfFKrN0ZMiHp0CLD9oqlBpgCf8yYQPi+ukvElwB4JpqQGh0AnoQl/6bmbn8kNSWGRiwKwPP++OhWUzH3zNeK9mKXwdcOAaDQ9NYl3eVsoKT9LomkGxXUubNSr3wbJTJU2lPcz4xvZbE8y2j+PcNkS8k7p80xpRX9uIc8DXMjTTSHtJw+ak0Kfbm5O0WhP11g7vF30FJN+Uo+vUJK4pZQ05S8Q/dWidHrzO4eFTXc3rn7rXM+A4yQ6yRXZL/Aj5kczhU11//GmDFyyRiDXjIIJZRiwWA32pfzlsK8A+oKz8HZACaUjCwoQ1kUbp7SVwFyZL1ca5kZ8562SVWu009kWViUhCX3fi7AY2SSnlyzgE3QC6+6vy8uyM5Tuk+WTGwFxOvET7r+/RohiJSzGVc22gGZtgwP1UjSwwznLo0cVscMzXKFwhP/69iLOwHuLUX8e4AHEVFql42rVFDu3Q7mJsFajfnOnhkrYi55a5eatyut/5nBnTTld6NqIy51+3OON2q7weXA2tIj6HiGNOM1wlISl7W4ZVMWPziwN/r/SHQwv+Bo3dYytEsUUFkawfFxeFIPMMuuly+nM1gYwE9cmgNBKws7ilUbAwzDckgCCNPWgyv0obqpC2i/K3NqAK7vQAZVhBk/LJCu17w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(8676002)(122000001)(186003)(83380400001)(6916009)(71200400001)(33656002)(508600001)(33716001)(66446008)(64756008)(2906002)(66556008)(6512007)(38070700005)(86362001)(316002)(1076003)(8936002)(66946007)(4326008)(91956017)(76116006)(66476007)(6486002)(5660300002)(54906003)(7416002)(6506007)(38100700002)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sFaV0zqu89OdqWfCoycFUG/7YLwkwsqx0UNfkxenlA+rdVAirRMFVNuPvYX5?=
 =?us-ascii?Q?9lZFOQ/1vN0VIyJLdmV7XOMjW1S9RhQbD5Hw01KeU3xSjNK8+apSJq32IZcW?=
 =?us-ascii?Q?UpVB2qcxY+zvoDFHIix3jkxQ4vm4bGoONS5RWqimeXCUu5sjnR7KMKFRr8FN?=
 =?us-ascii?Q?AxXDtocFDqipXI3GanyJAF3zsmXRlwbZ7GJdsESH5pNT0H96KbgRjPdHEvYN?=
 =?us-ascii?Q?lj2ZspVRhRFuRXIhiG4zBcVjrcL5ZA1ktgrIxewM5SAeEMAoBJx0necc+LIA?=
 =?us-ascii?Q?vS2hbthxsUizYt6WtUzfcI+Q+IHQnvLjvm97wO3lCidEXy7dQSmoE7/+YoYU?=
 =?us-ascii?Q?wdUpiehdzeS21FrCHYJdF4HFOqrX0lppuqihba8dRo6OwrgHzVFGYWSUc6T+?=
 =?us-ascii?Q?YZ3qtUmFlU9x6AWZOcUJAxTJYvM1dvAPEioqiv0/QIXrfwWT2BYUYSYFsTn4?=
 =?us-ascii?Q?MpBfRuE1NF/M/jf8vYfyd2LHF0IjImzpErn1WfLd3fMrAhvmEbBTbO+4MM6f?=
 =?us-ascii?Q?Z6edEV7vDrrBcoVrpQGd+rUa+hSgdPV6T9CA1aJ2qh7QLzfjdBW1YsvNH3AJ?=
 =?us-ascii?Q?apc5I5BSlZ6gKpINMHvhC3/1vINz4QaVixzjZFB6fgq2552B3b2eVf6ef38p?=
 =?us-ascii?Q?fTzwEQieOHDPo3S2W+2QuwSQ+20Wk80YxE3zWetoT7N2+6HIkHGMlTFv6HPf?=
 =?us-ascii?Q?2w7n5FWjYzy9JZANN3u2STvb6ZKNlMGKM8XS5ODZzt9KSKyrKVXOjdDa3mv6?=
 =?us-ascii?Q?jxhYkgf6yRyJggfPiz4TbU4b6ToRlpDIne4nHM0hH7rNiJDBz+0q0eDn8mtm?=
 =?us-ascii?Q?8mMQWtieaGSHcyxrDUCi+aVxEtsb01BxH2rjRSFY7xSAGPeP6y4fBA2GrtRa?=
 =?us-ascii?Q?VYS447+JnuCv9ExWbfOWL8hUQzs/uG0l4s7HqQzCeD+5V8rvOmxC0PjZ+CTV?=
 =?us-ascii?Q?d+AnctqsCJbLdvbS0cZEbuEAopAZdS6+TKjMkvF+PrUC2IZqTEyFUAydedXA?=
 =?us-ascii?Q?0kD4JTKvqCv9cRuTOZkGPUs+tccSoN8wg5RoAvLIO60MSHfTtNDk9xqYMtxN?=
 =?us-ascii?Q?tiCXM6YoA63VC1RMNfHxzDuxGQXKzANuHSDEv7K3LC8IbVNA4LZUG9oRU+t9?=
 =?us-ascii?Q?UNNq+7QSJgoqCgfKzgLo5MKQCGPZHCh/YYOTT92VpBCVlUUIejd7m+CWAY4N?=
 =?us-ascii?Q?YtI4686VTmS9iiKyCR0bIjMap8a7SbjclUnJygVb3YNkxWqYKjXSCGefe1ii?=
 =?us-ascii?Q?gVHC9nBfXX5Nc7/S3TekU5suezO+iTpUAvJtRXshMNmiSrX30xP93cyA9XWN?=
 =?us-ascii?Q?DgL0MMRPaFD5m700hp179KsmFpeXaeaXzw0VG6B54khYLzb5/ZItTEge0RQ4?=
 =?us-ascii?Q?hShHS2ptxh9EceIAEpGm7sLDz+6Ymrtlbpyza+kUR6dgdWLwP53A/BxaEszL?=
 =?us-ascii?Q?BnhxPkfw0uw9Q88Z9jV/WJSVRxA5ACrxKfyPS2VJoHPxMZ6L9T+FXNVt0IIt?=
 =?us-ascii?Q?qQZ0LQxHzSdIcrCAWeZLn5hzbZHb0aT6UJ4nFeCo8zC5eGVO8lobEHmNafwR?=
 =?us-ascii?Q?pukN6X6thtc0FS7QJA/SmVYfqhFCMTlHwKE7gdi1T2dgEl+N5PMrW6yw92xf?=
 =?us-ascii?Q?oS409JSkMYZjiWAy1pF9rC0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <966ED3E34F8B6E43AB8C2EE5D46DA139@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822b1a9e-340f-473c-0c60-08d9a97e44ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 03:56:43.0600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/mn+y/hrAGJvgTE3vQGdT6qkZvjdFA6x3BeCIxig5cclF5oT2XyCkWFu2NMlAADu9sD04ZvS0QtktEaTj7+cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7894
X-Proofpoint-ORIG-GUID: TU6xJ7G0EfzaDLW0TpxJxaF7WyOJ1QiF
X-Proofpoint-GUID: TU6xJ7G0EfzaDLW0TpxJxaF7WyOJ1QiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_01,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170017
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 15, 2021 at 10:25:39AM PST, Iwona Winiarska wrote:
>Hi,
>
>This is a third round of patches introducing PECI subsystem.
>Sorry for the delay between v2 and v3.
>

Hi Iwona,

I've done some testing of these patches on my AST2500/E-2778G OpenBMC
platform -- I had to do a small bit of hacking to add support for
INTEL_FAM6_KABYLAKE, but with that in place the newly-added code for the
8.8 format seems to work as it should.  Thanks!

In poking at it a bit further I encountered some sub-optimal behavior
w.r.t. to host power state transitions and timeouts though --
essentially, if I ever hit a timeout in aspeed_peci_xfer() (for example
on a read of a hwmon tempX_input file after an unexpected host
shutdown), it seems to get stuck in a state where even if the host comes
back online, all attempted PECI transfers continue just timing out.
(Rebooting the BMC seems to resolve the problem.)  This also happens if
I remove the peci client device via the 'remove' sysfs file, shut down
the host, and then do a rescan via sysfs while the host is off (i.e.
another operation that times out).

Let me know if there's any other info that would be helpful for
debugging.


Thanks,
Zev
