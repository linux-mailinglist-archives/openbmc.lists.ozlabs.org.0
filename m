Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D077B7627
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 03:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=XHq6o3qy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0c9w3d9lz3cDr
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 12:12:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=XHq6o3qy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=56411ac078=zweiss@equinix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2246 seconds by postgrey-1.37 at boromir; Wed, 04 Oct 2023 12:12:02 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0c9G07wxz30Nr
	for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2023 12:12:00 +1100 (AEDT)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 393KLCaO001131
	for <openbmc@lists.ozlabs.org>; Wed, 4 Oct 2023 00:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pps202002;
 bh=S6N5pV+QRn6jTbaZGPnZTZTKIDEXpvHal3ulYxsTviU=;
 b=XHq6o3qylhAgTr4h44tMWmWFoIBgl9jRtHBHRdWNJrHGVMMmxGLd0AroOBInQbuBzwxQ
 v2LzhBctRcFGkdrkdbhkvxVeLIJPL8CBvjVtlj9F06YFdZKbp/z0WaE7WP7Q+GQ2iEpM
 3zhHWDgfE5ZpKxBLFNk//94U/pV/LCSBBnZPFNoOr5W5zHwjdPTDgbTwfl+HfXQyw7q/
 w3AjX9Y6m95JejT147WwC2by7VJOlMWUOZ+S2n+5SYlM6J7Udo+UA0sytum79ewEdNA/
 R5nXQrve0S9Z8GPbPXbr2FHJvYGNU+/rxmJXRZ8kPtD5cYr+wwO/GUIjPchx4nlQuY7y oQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3tgp6m9d7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 04 Oct 2023 00:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGCse1T77jDLgxAI903F+UbIibcphTYrAGmerlwzIayj593tKVgrtJiQq++n2j2dwpXzExql7mI7Y9kGcFQA7WOty5/nsK6AIgjAfSjaiBEXIUiDbEOldbMm1z6+nvliJ6vsg4oIAHgDxTTXjB6Z1XAj27eB1RUN2yb1WrwjvcPXtliWmY4RFgv+dCBReYoE97x7kit+Hhi5gin+xg22QzzA3F+1/uv2Bl24snGzssYC4FFFgVxFHgoJputZbqhHmPDY9LWOyYhnffdezaFUfY4svvCnhU/dkML4YYbVw0lGRw5bSBPUKTSLwPeveVEZEQQHhQ9G/YHv1o2Why+JoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6N5pV+QRn6jTbaZGPnZTZTKIDEXpvHal3ulYxsTviU=;
 b=Js3RwXFjiJl0g8Bpi8XMRI0o4lo2lt3uK71AuLlaaVbIzStlmPkvdZ7NsAwYQknm8rCRw3+PdJ/Zqk6tADOkoGdIL844awDrel0b+hVgVTk7lm/wIUeVzSAXxsi+6nYXEohXzqIbA1HpjNueUtqwVGe/fnm5ztnbZcc2BsPHFUrmbCIRlNEMzAlPJr24SZj7o20Xgyj6G4h5Kpb2VWfkxmvh4nNvVAypQKFL2FFF/2tJD3i91rxPnEmIuLQq7c7cc/GgkHSOsNBbAdhGuApnbtvIojIkniGAxs4QN9DUqLnH0gCEn8paUEfLffPgooUEtZ3Y8cckkM9dL2R64bpduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by PH0PR04MB7834.namprd04.prod.outlook.com (2603:10b6:510:d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Wed, 4 Oct
 2023 00:34:27 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559%4]) with mapi id 15.20.6863.024; Wed, 4 Oct 2023
 00:34:27 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Aspeed SuperIO runtime management
Thread-Topic: Aspeed SuperIO runtime management
Thread-Index: AQHZ9lqIGyzia8i9kkGEl4SBlUebUQ==
Date: Wed, 4 Oct 2023 00:34:27 +0000
Message-ID: <20231004003427.GI19997@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|PH0PR04MB7834:EE_
x-ms-office365-filtering-correlation-id: baa96c92-0931-4797-1d8e-08dbc471aaaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lDntrur+XHheqfa8aj+GjdMsROvEM/9JCtlxdGfYfkyK+07naZL8X12Jz1sMFnxbnqH9NFqh2aviW8hr2XatUMEwexEOp1MvhtiRxHy8KfBcuxczjXiw4Sx8aHgAcSaOLTJ2d0kAabrIbnVpE/vsWT6btnXJZHuKzrQGjEu69764q1yCf4JwmvhCdRvFvjb5Pv91sPCp09iU7QuTvj0dparXsZSmkmZjKniLXAuSPQ+4Qk3/eP5WxbDR38wTDBIKeNvf/ESGZQrNJi+IV9SZ6Kqj5/uHPtK248UnhzfMGya0pEvnyyEs0uB5woM9x0V2ppFAPNHe4ZVWLoUQL9bv+Y3etxXNz2vKSGDNTlWhkYkGqverTTbXzaj6pptzp2vSl1qF+I8/Mt/0yz/+AgExdzv23OKfSHcESmQNdr1lrF59PtXbFSfzkmTTtoYb1TZps0fRqpe7JWlXbnKJZWwGt3R05fgRvPISm1pEKjxj3sByXv3x68GiCuJvzBMx1dVHJuTh/tWU2uX7JwPnJEMyIK/CVO0ETWtS+IAQPbAmxn3vNiyjXyq0hiEgOvqXoyHYTaAIolzYrigwy0dltc6DHECS66LIhHEibKsJfArRU81bREZiauaHcQrSgcBuRr9i
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(76116006)(66476007)(66446008)(66946007)(66556008)(316002)(26005)(1076003)(6916009)(64756008)(66899024)(83380400001)(5660300002)(8936002)(33716001)(33656002)(8676002)(38100700002)(3480700007)(38070700005)(86362001)(122000001)(2906002)(41300700001)(9686003)(6506007)(6512007)(6486002)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?LEWs18xLVU/9DRx9ech1+9OuniGmOhGOwWRg2eGt6D6bJls+pT+E/3pqWTnK?=
 =?us-ascii?Q?E5OjbE0BejxdWxDO2pueB7CGNys57scdIajQb/TmncczVSXDFAJzIZt3K45P?=
 =?us-ascii?Q?pM1RwCjAtTFwxOMrO+xA1W3gC3e08Dyjfc1dG6GyqAkYsaPTI5/WSWwGIUZ0?=
 =?us-ascii?Q?G9bojaeflNulU0RCuRPlsDzb//MC4OyAKBXKJezqywSjZqMxRi0eUJGPLUu1?=
 =?us-ascii?Q?22o1H/wlENu45zJYo+r2q9B4r0AnI53ABTGeb9EMsV3I/2yQZ9zSQQNZ+QLE?=
 =?us-ascii?Q?5ayH7OTXBob4S8hoQimAJ3qhMUqvms7J/yZHMjhq+WlKE6OzA8X3kcWVpyhH?=
 =?us-ascii?Q?uqEG0cYcNisM4L10yL+jCe3Pm8SqRl/WWvQywQLEVFEnDZyo1Au644jjy767?=
 =?us-ascii?Q?YP8nEiGAxU6c+DilblS2kNPsX3F3QrRkRL1JmkdOn2xdzt6Ptp5qlAOaRTxq?=
 =?us-ascii?Q?av5sW0NDKSlw5phr9TTvTKR1E9+nCOrmrlAg7WwtKGZbFKMlSoy1lU4x1c/F?=
 =?us-ascii?Q?wCk3XuEeuq7vA+PBsI5/sfEsho06ey2OCwEWcFgzPnR5gkhz/WQoLZHtGwrM?=
 =?us-ascii?Q?ICkM4LfrgmnyLKoUi2UHe9galBvR+WYN7yPf0UBkMLjD9qSJa+2n4Ac5Jazu?=
 =?us-ascii?Q?jfVHAVWHrVlAc1nLZ0uLWGc8iqdKU4/B9jLT8hOSHbMHVNBxyADW7fa8MUvW?=
 =?us-ascii?Q?qdNrLgft/9W++D0C0v5SGup+ACxYyauB3uWk0Udp4LxDQmdWEDRi3xVBPjRA?=
 =?us-ascii?Q?HqUnjXoQPOWCzI1D3PlxINZ8/yIbUr0bIfqYwQ7gmgIjci6oAkxJz6uKZSa5?=
 =?us-ascii?Q?KPR9PPctE/RmrFwn05BJRDSJduF/649PeYK7oMT/dKYU/j2aYYeFeAejosg+?=
 =?us-ascii?Q?RVGJwZ/OEvpyesPF/QobUqZgas2SYI5/VuvSEZQA7tfjo5CAC4Ggt0Beo/N5?=
 =?us-ascii?Q?ZdqwZLRSnCcb1Sx/7pE6w2ScsBrq/e0C/bnXWdDRmyoDfJj06c4bErtY202D?=
 =?us-ascii?Q?Dek3Dvn4KeHwGbCJw2Wl1F8BWwgErHaYo1Mwxhh3tGKLmX95ZzMI1pwESqbx?=
 =?us-ascii?Q?5Sbf/y7zC5qriRBS/t2Q0eJ+SHiXPzxpobhPG6BU8XuP2BNpvYgUddyhhual?=
 =?us-ascii?Q?DAD33ycUvebfLAsTY4uJp89eoHYZDo76CuiDpIvCFjLMn5ebIgJCtNlX8wU6?=
 =?us-ascii?Q?piiZGAhLChJeSYKKzJPa9RuV5Wl0ucV+9gD5PDySrL3yYi0hMAZkdIJcpHDG?=
 =?us-ascii?Q?kG6fX/bhC+9IMVDYuzwo32l79J6FCHL0BaeZgvz+K0TCTV2OO+l1/SQZmXHE?=
 =?us-ascii?Q?fhELI5K6n8iWBRlba0ongLUMs5jMdLDVzMu+CGChBeb7EyX3wsWymn3/EVsm?=
 =?us-ascii?Q?bVVvDCuub4Oxc4TFIsXL8dWwD7RHNAYeTXI7aG8FKLuepxDjjh4H0Ga+RyYn?=
 =?us-ascii?Q?ysiavYWcLHMBbmDG9OWmFNAxsIN56l4Y5LUHgM7/fLj6jJhlj1aA2pZQp6mN?=
 =?us-ascii?Q?T2Tv8LUEaNdXMDoKMOdT9W7t308kPOnnuAVY+SMQXS4l7u9Gl9jsAbfJUrjC?=
 =?us-ascii?Q?5GGczD+i7aOF1WwjyBs9IanUVU1L9iCxJgIRlAus?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2EF9DC362936E24F9FD6F1CAC07F7BB5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	P1uuwXi2RWDRcGtU79GiKRPCyhiSNrkxf1+wBzVpNuTqtLHyaVMxwebVj7S3ka0pMsnpB4HQir2uaEQRLR3RHLCNBo/bOqYKd+5AEo8o09s1FYPh1F73tU6l+v686KDuHFGhNbYlqtN6KpWJbHlkleOb29IxRLX0WRfpP1aYHHQy2SQNxdH4IoB6UjBH9imxvZ7Nj63AGYMwEk4VDKoAVar0RIlzyXP7o94aXKrIWKXekGB8wMP052m1W9XEXREbJicRVfJaM8SMIPrA1m68LUBFLQsev5eWhCepvvX0HXYJ3bya1+V2aojw8RQ5l0ZMfaAnieefQBF2HAs66bQAFI5nJDSY0Q8tU8aFCVprgG3ufriicoFB2DWiVcaVn4cqWyli8Zj7PfM1RkCGD1HhlmUkYz1kac4r9wEo4wQXo0JIqvXBIKe4b0+iY/i9wivhFMuaN4dmyJzeBZIH2IVuGNg7ZtlZyXGmWi7UqyriJaXWyJ1M5N7Ocu4eWltq3idWoHgJf1UzHKMbaTf7ZKpx3hiqw9T39Exwx/COBuK66u6FFodo7gRw7EFQ7lJJJ+yA9ARN8E/gQc0a+7xugN8y2DuIDoVy3Fj78eeCIteKvVGVOuf3CMiIibp6wp6owpE0kSR517qYZxJdsZilsPjlPmQZ2heu1mPGsV5r7eZdf8MRWSakhHftOzNrnQ4THfr6Fv834IfCUJ+dBdXNaS7kShbl6w/hcthQlUOcATQeMLRSroI6DapmbeDIEUevRe1I+HJlsUr3SPR/E+UD+0FcdruCm0y5UFjgP8TrQuQeHQRuyriIhV7bG5o94jMEhKQW
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa96c92-0931-4797-1d8e-08dbc471aaaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 00:34:27.6745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zy6psmOdPFEUJu69VBDTXs0tMKB1/T97D+PK6k+S1gS4zyr78rGltxNndnxj2eOk/S7417E1so3gFwmtdieW8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7834
X-Proofpoint-GUID: -SmDqb5BHZbWbQdSxFqGz2kUaFwRkMID
X-Proofpoint-ORIG-GUID: -SmDqb5BHZbWbQdSxFqGz2kUaFwRkMID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_19,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040002
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

Hello all,

I was hoping to gather any thoughts in the community on how best to deal
with a problem I've encountered on my latest OpenBMC platform port (but
which I think might be relevant to some other systems as well).

For reasons I don't fully understand but that I think are orthogonal to
this particular issue, the platform in question can't use the Aspeed
VUART, and so instead uses two SUARTs configured back-to-back via the
UART mux to provide the host's serial console.  The host's firmware thus
enables its UART early in the host boot sequence, which requires that
the AST2500's built-in SuperIO device be enabled (SCU70[20]=3D0).
Unfortunately that exposes the BMC to some of the CVE-2019-6260
("pantsdown") vulnerabilities, which is a pretty big downside, and one
that I'd like to minimize as much as I can.

The SuperIO only really *needs* to be enabled during the window of time
in which the host firmware performs the UART-enable sequence; once it's
up and running I can manually disable it without any adverse effects.
So what I'd ideally like is to have the BMC enabling and disabling the
SuperIO at runtime, turning it on only when it's expected to be needed
and then turning it back off so as to minimize the exposure to known
security holes (while in general I wouldn't like the BMC to consider the
BIOS/UEFI code as "trusted", it's hopefully at least less actively
hostile than whatever might be running when the host OS is booted).

To that end, what I've currently got consists of:

 1. A kernel tweak (currently hacked onto the aspeed-socinfo driver) to
    expose the SuperIO enable/disable state as a read/write sysfs file,
    and

 2. A patch to x86-power-control using that file to enable the SuperIO
    when the host's POST-complete signal is deasserted (and disable it
    when it's asserted).

Aside from being a bit of a kludge (and a fairly special-purpose one at
that), the major drawback with this approach is that it seems kind of
inherently racy.  When the host resets and the POST-complete signal
deasserts, there's nothing synchronizing the BMC and the host to ensure
that the BMC does in fact enable the SuperIO before the host tries to
access it when it goes to enable the UART.  In the stress-testing I've
done (including swamping the BMC with artificial CPU & interrupt load) I
haven't ever seen it "lose" the race, but I don't have a terribly
accurate sense of how tight the window of time really is.

So what I'm wondering here is:

 1. Does anyone know of any better ways of handling this problem?

 2. If not and this is the best option we've got, are there better
    implementation options that might be palatable for potential
    upstreaming (more appropriate places to put the kernel side, a way
    to make the userspace side less of a hard-coded hack, etc.), or is
    this doomed by its nature to live out-of-tree?


Thanks,
Zev
