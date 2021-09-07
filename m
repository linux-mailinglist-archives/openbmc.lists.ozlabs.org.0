Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3D402687
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 11:52:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3gYS409cz2yHX
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 19:52:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=m0o2nGOb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=38843d7cda=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=m0o2nGOb; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3gXt11jQz2xb1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Sep 2021 19:52:12 +1000 (AEST)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1879heEG008145; Tue, 7 Sep 2021 09:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=ijIcJl6YUfLBEusPmC7GUb7HJ2EWPYZR4XWYOpRYTLE=;
 b=m0o2nGObcYhG0DCQlpWHG0woE6vEiVLKug1wJyEjwwB0a+XEml6SdTVsY213yLEHyHdp
 eIUTY/X8Z49d/FqUHBY6u2tGKI9i/VuQhFrAsYaawacCeYTSaVNqI27udQYHgSTB5m4J
 dt22k0Xx/uoxIxiVGgdsfCSVzkfKLVrTY3arADU50C+ZK4SPLHvlXpRkjxm8/oYqe5n2
 JI2Dz6XeIUzekjB7mWv9H1OO3EnKDHIOuivmb3LivLfhdC1udEgX9BTgSGuKBd/fBF1/
 yq6tzw/GbKjbgrya+YG23wnwCZ3foGUKSfb0BTaVZ+djT2OS7DnxWImcAJl4QtrG+hbC aA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx07-002d6701.pphosted.com with ESMTP id 3ax4r20c5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:52:07 +0000
Received: from DM6PR10CA0011.namprd10.prod.outlook.com (2603:10b6:5:60::24) by
 BYAPR08MB3864.namprd08.prod.outlook.com (2603:10b6:a02:83::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Tue, 7 Sep 2021 09:52:03 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::dd) by DM6PR10CA0011.outlook.office365.com
 (2603:10b6:5:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 09:52:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.30)
 smtp.mailfrom=flex.com; yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.30 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.30; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.30) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGYepHPw4A9xc3dfj0cCKG7FyXiwbhnB/yoB+RwzJNOTp7FpFcv8vWMZgiDvvYV7RviTErrF6BJG/GknFLslorHz8KjbLvnzJIn8aTKuGVlA4wwGxu2OseCeVtWj4TbIfRYhlVAGCE7OWObuZqVD5L0BARaPbLM7e0+HMakVaLzlGEFML8i9VeU3EGHdjwwEiDpYcq0Up72KYtwGfMzPhkK9aSCLJw2NrDLvuoG3gUkoW33JgucTTnr3l6yRiOTEmHsdUdsJJ4wNro+D8iWW326aFs4aWSGzExn1T4K5K9YRSMNNSfMkEji3fMoPEazTXYAhnX5bX/rsW1bmvPejrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ijIcJl6YUfLBEusPmC7GUb7HJ2EWPYZR4XWYOpRYTLE=;
 b=n9B+GMNCvly/KmnWTaFHNlF8J3hgvTWM+0tKlZ3gGzQlmGLTjovqqD/ywmnuUBnF1mAsF7tCauuXsN9b3vy5Rz123yqIZIUQAk0lMYWetvi/23DHsGIv+OAIlx6KDlS4Tw1DhJhpuPxDnZqPcZB7SrjH1ZQnVHTb8GP9e2oLSGucNIhYpo+paZk6/fDNoPk6vsRrJ6h1LpnBoudU2msYT1B+xkUMtkL49IuKfxqdlsood+FoqHiusjgAQJURFdqgCt3/GH02O4Qm9DXM/81GKfUdgays/+nCYu0WKrUlxIpuNgDPg1CAsvhZ0Fk5rdsHCEcVpO1EANgAbxyTimaymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4748.namprd08.prod.outlook.com (2603:10b6:5:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Tue, 7 Sep
 2021 09:52:00 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:52:00 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0Dogpl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91?=
 =?big5?Q?t_IPMI_(OEM)_command_development?=
Thread-Topic: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_(OEM)_command_development?=
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAAOsACAAO1euoAAmL8T
Date: Tue, 7 Sep 2021 09:52:00 +0000
Message-ID: <DM6PR08MB5514D3E2103969E07D4F0AC7DCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <6605257f36d729f8e4c57387209cb0df1b4a1ffd.camel@yadro.com>
 <DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 4e757209-cb9d-daa7-6bb4-da8dfe82ab92
Authentication-Results-Original: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4a49ba-e4f3-4501-8dd7-08d971e52539
x-ms-traffictypediagnostic: DM6PR08MB4748:|BYAPR08MB3864:
X-Microsoft-Antispam-PRVS: <BYAPR08MB38646A645F6199BF12D3F5DEDCD39@BYAPR08MB3864.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /MnB3ifU5eRSVZn/lCPs29/jzCL3MFVoCscAJwl/ly49LQEiShVDpqcMcCdAXvvSIV8LjcqbDCAuRGMCXrsUNOV60aLWCuzFHw0PQDuVPGaTFhUCmOl+Ua5Y1563K21xQ1BiSRqpOdr2hTDxxMBNvRIH34iR9KSfo6nYlhi+s/ZK4lEnat0n/9ChMdyxy8v7XcCoa904aovCoJicmOPvdwZ7/501i6Dpvqv5vWnODRoyLRhPEJ0CpK2OpkLW0MImwUdDGRFyh9LQ+ToqanKIhaCxYySCiwoidkl31E4tfEy8OBEzEp5zfJ4dfjaFu/1zIw8oLuNRm5E2BJSIUiieDsHwVpes/nO5FYDsrs7XXMH5KCx5z4STUeUL01ZxAx+QGWviyEg0evBbBGsJHdHWyRRIo+D021XIL2b8WeDa/XQLWn10v/sl9GKjVuLSI9kI6Ts9qx+u06QQkcXvs2hQNYePthJjXyFBjzCq6yNZ5e+dqLVFQQ8t6geETN2U5Dvt8wZTNlHG2Uc4WEwp3dHHh4O78kNy10OihUw82fVw9D802XFRzNtsvd3zO4toqxUY1waWV7/nXk7Rn6PEWFOsnSosSXW5UWXZXTdpqy1p9Ncg093xCMCJvPQTE1tjQKn9XgR/pS6i7oC94sOoIa7Uej//sZRxl6wbQnHU9bt0WjZ+iMpbLGYh+raBsLcn2rF89xZPnVbXgo2AuTooCJzCs1rh6HCCMTmWNRDa7EMdbOUhN6xkWzEC5Pe/tB0z5QmvRkamwGIJnsl/8oWRgLBP8XUi6OeRG1/T3if6d2IsR/5Dr5hNmsameMU5bfZ7yYgw0vjZo4pe5vs2d10Qz5qEWS2Y8Prj/WP3gwmEaqnMxux2kOUGl4NKwbaxbMuB6FNReHXQPNUux5cj8Hj1ph0d0Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(136003)(346002)(6506007)(91956017)(76116006)(64756008)(66446008)(66556008)(66946007)(7696005)(52536014)(83380400001)(66476007)(2940100002)(5660300002)(122000001)(316002)(110136005)(38100700002)(166002)(38070700005)(224303003)(19627405001)(18265965003)(478600001)(2906002)(966005)(71200400001)(86362001)(55016002)(9686003)(33656002)(8936002)(186003)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514D3E2103969E07D4F0AC7DCD39DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4748
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ace58bbd-78a4-45a6-4516-08d971e5237f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZ7W99WRWYf10Cd0zLAGf2NDlWqnm4gCR38qHabqUWDauGJKoXttdC1zqmyGFa1sAjzo9C7XnjWpZUCXO+cFrguTwMyKyefVYltD7jcg7UWeIewqJqPK5w53OVmATGNo+MY5ArEJCgTq3832sywuYyUfGcfgrhrXxgUzk9qfOUgM+vCanWtqHd8eBIuvZHSNeuDtRSPRfQrkpRJeI0BBhWwypXR4P2UbXkVsucojJn9TCoEa7y55TNFCccU0jGGqfOricbkXvm3E5Iq6yiIyKKflP/GhYQ1UsSvJ423ooWo1FfBqXWHbuYMDfKh7ZPJ7VFLe6n/qhVvpH7YcwcrlLJ5+Hotc0+rrQ/8Km9q2A6Tz1H2DSamFs332w5yFdMaPGkshR6rixsmyCqVJLvlNrhrGPy4FL1BOXV8GeHrX0JDXDlVVH06891DajguZ4I3BLCzWOoyb4qmwoFMpi7KXV1jA06DDSV28Y8yNldj3bn3PIgwtAYPElwSAh+O2mcre2ps73i4bveEh1kF1QG8A0RIlvmIcaGcsUusVHC0Ss4N6FVy+LKHvoXkNc8uzhg35ukbflRnCAif9UNvSMoyEE4eKwFyfRGAsVTpUPSEHih6beklVGyZQ+iuxwlwIhgxAUsEMgdtj8xYDqifntg/Dx+hBLwwl9mmnHYzQLZBrGzn6U0hzVTb70m1ea5fp4VSW6rvmjYrTAUrMAT6FdeJCkEw5OsCn8fBBTKb6W/jKPuzCrKvSZNawsb305pw6A19sc1pjINUgnfHaw/IU8ghqQwIJlcQF3USgjCXp4eTxFvDtjPCzW5giZ/H20l4XPWTvvC9LQKOVdlIMDpWTGrTptr/OnvwuuB89Onx/QfCWzUn6tld8X3gx3RAUkS0Qm0DojaMfGdYWTLCBldIe90tB/2hQnLGnQllA5Fexv0y8QYA=
X-Forefront-Antispam-Report: CIP:144.49.247.30; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(2940100002)(166002)(9686003)(47076005)(8936002)(356005)(2906002)(70206006)(83380400001)(82740400003)(70586007)(52536014)(336012)(224303003)(55016002)(36860700001)(30864003)(33656002)(966005)(19627405001)(316002)(7696005)(4186021)(86362001)(82310400003)(26005)(186003)(110136005)(478600001)(5660300002)(6506007)(81166007)(18265965003)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:52:03.2695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4a49ba-e4f3-4501-8dd7-08d971e52539
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.30];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB3864
X-Proofpoint-GUID: 3E_YEldC5offjfIN-RDoomwqY-h9eZQP
X-Proofpoint-ORIG-GUID: 3E_YEldC5offjfIN-RDoomwqY-h9eZQP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070064
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

--_000_DM6PR08MB5514D3E2103969E07D4F0AC7DCD39DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5kcmVpLA0KDQpPbmUgbW9yZSB0aGluZyB3b3VsZCBsaWtlIHRvIGNvbnN1bHQgeW91IGlz
IEkgaGF2ZSB0cmllZCB0byBhZGQgb3VyIG93biB4eHgtaXBtaS1vZW0sIGJ1dCBnb3QgdGhlICJJ
bnN1ZmZpY2llbnQgcHJpdmlsZWdlIGxldmVsIiBmZWVkYmFjayBhZnRlciBleGVjdXRpbmcgYW4g
b2VtIGNvbW1hbmQuIEhvd2V2ZXIsIGl0IHdvdWxkIGJlIHN1Y2Nlc3NmdWwgaW4gY2FzZSBJIHJl
bW92ZWQgaW50ZWwtaXBtaS1vZW0uIERvIHlvdSBoYXZlIGV4cGVyaWVuY2Ugd2l0aCB0aGlzPyBJ
ZiB5ZXMsIG1heSBJIGtub3cgaG93IHRvIGZpeCBpdD8NCg0KSSBjdXJyZW50bHkgd291bGQgbGlr
ZSB0byBrZWVwIGxldmVyYWdpbmcgdGhlIGludGVsLWlwbWktb2VtIHVudGlsIEkgaW50ZWdyYXRl
IHRoZSBjb21tYW5kcyBJIG5lZWRlZCBpbnRvIG91ciBvd24geHh4LWlwbWktb2VtLg0KDQoNClRo
YW5rIHlvdS4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCrFIpfOqzDogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2NocmlzLmNoZW4z
PWZsZXguY29tQGxpc3RzLm96bGFicy5vcmc+IKVOqu0gQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hyaXMu
Q2hlbjNAZmxleC5jb20+DQqxSKXzpOm0wTogMjAyMaZ+OaTrN6TpIKRXpMggMDg6MzUNCqaspfOq
zDogQW5kcmVpIEthcnRhc2hldiA8YS5rYXJ0YXNoZXZAeWFkcm8uY29tPjsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiCmXsLQOiCmXsLQ
OiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQTUkgKE9FTSkgY29tbWFu
ZCBkZXZlbG9wbWVudA0KDQpIaSBBbnJkcmVpLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgaGVscGZ1
bCBjb21tZW50cy4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCrFIpfOqzDogQW5kcmVpIEthcnRhc2hldiA8YS5rYXJ0YXNoZXZAeWFk
cm8uY29tPg0KsUil86TptME6IDIwMjGmfjmk6zak6SCkVaTIIDA2OjE1DQqmrKXzqsw6IENocmlz
IENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiBSZTogpl7C0DogW3Bob3NwaG9y
LWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1JIChPRU0pIGNvbW1hbmQgZGV2ZWxvcG1l
bnQNCg0KSGVsbG8sDQoNCkkgZG9uJ3QgcmVwcmVzZW50IEludGVsLCBidXQgaGF2ZSBzb21lIGNv
bnNpZGVyYXRpb25zIGFib3V0IHRoaXMgdG9waWM6DQoxKSBUcnkgdG8gbm90IHJldXNlIGludGVs
LWlwbWktb2VtLiBNdWNoIGJldHRlciBzb2x1dGlvbiB3b3VsZCBiZSB0bw0KY3JlYXRlIHlvdXIg
b3duIHh4eC1pcG1pLW9lbSBwYWNrYWdlIGFuZCBpbXBsZW1lbnQgb25seSBtZXRob2RzIHlvdQ0K
cmVhbGx5IG5lZWQuDQoyKSBCZXR0ZXIgd2F5IHdvdWxkIGJlIHRvIGltcGxlbWVudCByZXF1aXJl
ZCBsb2dpYyBpbiBwaG9zcGhvci1ob3N0LQ0KaXBtaWQgYW5kIHN1Ym1pdCBjaGFuZ2VzIHRoZXJl
LiBJIGRpZG4ndCBpbnZlc3RpZ2F0ZSB0aGlzIHlldCBzaW5jZSB3ZQ0KYWxzbyBwdWxsIGludGVs
LWlwbWktb2VtIHRvIG91ciBwcm9qZWN0LCBidXQgSSBiZWxpZXZlLCBpdCBzaG91bGQgbm90DQpi
ZSB0b28gZGlmZmljdWx0LiBEb24ndCByZXBlYXQgb3VyIG1pc3Rha2VzICkuDQozKSBUaGVyZSBp
cyBwcmlvcml0eSBhcmd1bWVudCB3aGljaCB5b3UgY2FuIHVzZSB0byBkZXRlcm1pbmUgaGFuZGxl
cg0KY2FsbCBvcmRlci4NCjQpIE1vc3QgZnVuY3Rpb25zIHRoZXJlIGFyZSBzcGVjaWZpYyBmb3Ig
SW50ZWwgc2VydmVycywgc28gdGhlIHVzZWxlc3MNCmV2ZW4gaXMgeW91IHVzZSBJbnRlbCBDUFVz
IGJ1dCB5b3VyIG93biBwbGF0Zm9ybS4NCjUpIFVzZSAiam91cm5hbGN0bCAtdCBpcG1pZCAtbyBw
cmV0dHktanNvbiIgb3Igc29tZXRoaW5nIGxpa2UgdGhpcy4gQnV0DQpub3cgaXQgaXMgcmVjb21t
ZW5kZWQgdG8gdXNlIG5ldyBzeW50YXg6DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItbG9nZ2luZy9ibG9iL21hc3Rlci9kb2Nz
L3N0cnVjdHVyZWQtbG9nZ2luZy5tZF9fOyEhSFNudGxDZyFHNjFYY1Z4VXI4SGxpOEhxSWxlYlZZ
amkzdFRQWHNuMzNXNW95by1GbFU4ZmJtNlpkNjZTMEg2Y3NlcnU2QmN3JA0KDQoNCk9uIE1vbiwg
MjAyMS0wOS0wNiBhdCAwOTo0MCArMDAwMCwgQ2hyaXMgQ2hlbiAoVFBJKSB3cm90ZToNCj4gSGkg
YWxsLA0KPg0KPiBJIGd1ZXNzIHRoaXMgbWFpbCB3YXMgZ290IG92ZXJ3aGVsbWVkIGJ5IGJ1bmNo
ZXMgb2YgZW1haWxzLCBzbyBwbGVhc2UNCj4gbGV0IG1lIHJlc2VuZCBpdCBhbmQgaG9wZSBzb21l
b25lIGNvdWxkIGhlbHAgbWUuIEFub3RoZXIsIEkgYWRkIG9uZQ0KPiBtb3JlIHF1ZXN0aW9uIG1h
cmtlZCAjNSBiZWxvdy4NCj4NCj4gVGhhbmsgeW91Lg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpcyBD
aGVuDQo+DQo+ILFIpfOqzDogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2NocmlzLmNoZW4zPWZs
ZXguY29tQGxpc3RzLm96bGFicy5vcmc+IKVOqu0NCj4gQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hyaXMu
Q2hlbjNAZmxleC5jb20+DQo+ILFIpfOk6bTBOiAyMDIxpn45pOsypOkgpFWkyCAwNjozNA0KPiCm
rKXzqsw6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
Pg0KPiClRKauOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQTUkgKE9F
TSkgY29tbWFuZA0KPiBkZXZlbG9wbWVudA0KPiBIaSBhbGwsDQo+DQo+IEkgaGF2ZSBzdHVkaWVk
ICJwaG9zcGhvci1ob3N0LWlwbWlkIiBwYWNrYWdlIGZvciBhIGNvdXBsZSBvZiB3ZWVrcyBhbmQN
Cj4gZ290IHVuZGVyc3RhbmRpbmcgdGhhdCBpdCBoYXMgaW1wbGVtZW50ZWQgc29tZSBtYW5kYXRv
cnkgYW5kIG9wdGlvbmFsDQo+IGNvbW1hbmRzIGFscmVhZHkuIEFuZCBJIGFsc28ga25ldyB0aGF0
IEknbSBhYmxlIHRvIGxldmVyYWdlICJpbnRlbC0NCj4gaXBtaS1vZW0iIHBhY2thZ2UgdG8gZ2V0
IG1vcmUgY29tbWFuZCBoYW5kbGVycy4gQnV0IHRoZXJlJ3JlIHNvbWUNCj4gcXVlc3Rpb25zIHJh
aXNlZCBpbiBteSBtaW5kLCBJIGhvcGUgc29tZW9uZSBjb3VsZCBnaXZlIG1lIHNvbWUNCj4gc3Vn
Z2VzdGlvbnMuDQo+ICAgIDEuIFdoYXQncyB0aGUgbm9ybWFsIGRldmVsb3BtZW50IHByb2NlZHVy
ZSBpbiBjYXNlIEkgd2FudCB0byBtYWtlDQo+IG91ciBvd24gT0VNIGNvbW1hbmRzPyBJIG1lYW4g
ZG8geW91IGd1eXMgZW5jb3VyYWdlIG1lIHRvIGNyZWF0ZSBhIG5ldw0KPiAieHh4LWlwbWktb2Vt
IiBwYWNrYWdlIG9yIHRvIGxldmVyYWdlICJpbnRlbC1pcG1pLW9lbSIgYW5kIHRoZW4gYWRkIG91
cg0KPiBvd24gY29tbWFuZHMgaW4gaXQ/DQo+ICAgIDIuIEkgZm9yIG5vdyBhZGRlZCAiaW50ZWwt
aXBtaS1vZW0iIHBhY2thZ2Ugb25seSBmb3IgdXNpbmcgaXRzDQo+ICI8Q2hhc3Npcz46PFNldCBG
cm9udCBQYW5lbCBFbmFibGVzPiIgY29tbWFuZCBiZWNhdXNlIEkgZmlndXJlZCBvdXQgdGhlDQo+
IHNhbWUgY29tbWFuZCBpbiB0aGUgInBob3NwaG9yLWhvc3QtaXBtaWQiIGlzIG5vdCBhYmxlIHRv
IG1hdGNoIHRoZSBkLQ0KPiBidXMgaW50ZXJmYWNlIGluIHRoZSAieDg2LXBvd2VyLWNvbnRyb2wi
LiBJJ20gbm90IHN1cmUgaWYgSSB3aWxsIG5lZWQNCj4gb3RoZXIgY29tbWFuZHMgaW4gdGhlICJp
bnRlbC1pcG1pLW9lbSIsIGJ1dCB3aGF0IGlmIEkgZG9uJ3QgbmVlZCBvdGhlcg0KPiBjb21tYW5k
cywgaG93IHRvIHJlbW92ZSB0aGVtPyB0byB1c2UgdGhlIHdoaXRlbGlzdCBtZWNoYW5pc20/DQo+
ICAgIDMuIElzIGl0IG9rYXkgdG8gYWRkIG1vcmUgdGhhbiAxIHh4eC1pcG1pLW9tZSBwYWNrYWdl
cz8gSWYgeWVzLCBob3cNCj4gdG8gbWFuYWdlIHRoZSB3aGl0ZWxpc3QgYmV0d2VlbiB0aGVzZSAy
IE9FTSBwYWNrYWdlcz8NCj4gICAgNC4gQW0gSSBhYmxlIHRvIHVzZSAiaW50ZWwtaXBtaS1vZW0i
IG9uIGEgcGxhdGZvcm0gdGhhdCBpcyB1c2luZyBBTUQNCj4gQ1BVPw0KPiAgICA1LiBIb3cgdG8g
cHJpbnQgdGhlICJlbnRyeSgiU0VOREVSPSVzIiwgc2VuZGVyLmNfc3RyKCkpIiBwYXJ0cz8gSQ0K
PiBtZWFuIEkgZm9yIG5vdyBjYW4gcHJpbnQgb3V0ICJTZXQgdXAgaXBtaSBjb250ZXh0IiBzdHJp
bmcgYWZ0ZXINCj4gZm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbiBsaXN0ZWQgaW4NCj4gImh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1j
L3dpa2kvRGVidWdnaW5nLU9wZW5CTUMqZW5hYmxpbmctYXBwbGljYXRpb24tZGVidWdfXztJdyEh
SFNudGxDZyFHNjFYY1Z4VXI4SGxpOEhxSWxlYlZZamkzdFRQWHNuMzNXNW95by1GbFU4ZmJtNlpk
NjZTMEg2Y3NWWnRIWU0yJA0KPiAiLCBidXQgSSBkb24ndCBzZWUgIlNFTkRFUj0iIHdoZW4gSSBl
eGVjdXRlZCAiam91cm5hbGN0bCAtdCBpcG1pZCINCj4gY29tbWFuZC4NCj4gICAgNi4gICAgMS4g
bG9nPGxldmVsOjpERUJVRz4oIlNldCB1cCBpcG1pDQo+IGNvbnRleHQiLGVudHJ5KCJTRU5ERVI9
JXMiLHNlbmRlci5jX3N0cigpKSwNCj4gZW50cnkoIk5FVEZOPTB4JVgiLCBuZXRGbiksZW50cnko
IkxVTj0weCVYIiwgbHVuKSwNCj4gZW50cnkoIkNNRD0weCVYIiwgY21kKSxlbnRyeSgiQ0hBTk5F
TD0ldSIsIGNoYW5uZWwpLA0KPiAgIGVudHJ5KCJVU0VSSUQ9JXUiLCB1c2VySWQpLA0KPiBlbnRy
eSgiU0VTU0lPTklEPTB4JVgiLCBzZXNzaW9uSWQpLA0KPiBlbnRyeSgiUFJJVklMRUdFPSV1Iixz
dGF0aWNfY2FzdDx1aW50OF90Pihwcml2aWxlZ2UpKSwNCj4gICAgIGVudHJ5KCJSUVNBPSV4Iiwg
cnFTQSkpOw0KPiBUaGFuayB5b3UuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzIENoZW4NCj4gTGVn
YWwgRGlzY2xhaW1lciA6DQo+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNz
YWdlIG1heSBiZSBwcml2aWxlZ2VkIGFuZA0KPiBjb25maWRlbnRpYWwuDQo+IEl0IGlzIGludGVu
ZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBp
dA0KPiBpcyBhZGRyZXNzZWQNCj4gb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFkZXIg
b2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQNCj4gcmVjaXBpZW50LA0KPiBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4g
ZXJyb3IsDQo+IHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRl
IG9yIGRlc3Ryb3kgYW55IGNvcHkgb2YNCj4gdGhpcyBtZXNzYWdlIQ0KDQotLQ0KQmVzdCByZWdh
cmRzLA0KQW5kcmVpIEthcnRhc2hldg0KDQoNCg==

--_000_DM6PR08MB5514D3E2103969E07D4F0AC7DCD39DM6PR08MB5514namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Andrei,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
One more thing would like to consult you is I have tried to add our own xxx=
-ipmi-oem, but got the &quot;Insufficient privilege level&quot; feedback af=
ter executing an oem command. However, it would be successful in case I rem=
oved intel-ipmi-oem. Do you have experience
 with this? If yes, may I know how to fix it?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I currently would like to keep leveraging the intel-ipmi-oem until I integr=
ate the commands I needed into our own xxx-ipmi-oem.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED C=
hris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB7=A4=E9 =A4W=A4=C8 08:35<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; =
openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> =A6^=C2=D0: =A6^=C2=D0: [phosphor-host-ipmid] Questions =
about IPMI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Anrdrei,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thank you for your helpful comments.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chris Chen&nbsp;</div>
<div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Andrei =
Kartashev &lt;a.kartashev@yadro.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB6=A4=E9 =A4U=A4=C8 06:15<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; o=
penbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: =A6^=C2=D0: [phosphor-host-ipmid] Questions about IP=
MI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hello,<br>
<br>
I don't represent Intel, but have some considerations about this topic:<br>
1) Try to not reuse intel-ipmi-oem. Much better solution would be to<br>
create your own xxx-ipmi-oem package and implement only methods you<br>
really need.<br>
2) Better way would be to implement required logic in phosphor-host-<br>
ipmid and submit changes there. I didn't investigate this yet since we<br>
also pull intel-ipmi-oem to our project, but I believe, it should not<br>
be too difficult. Don't repeat our mistakes ).<br>
3) There is priority argument which you can use to determine handler<br>
call order.<br>
4) Most functions there are specific for Intel servers, so the useless<br>
even is you use Intel CPUs but your own platform.<br>
5) Use &quot;journalctl -t ipmid -o pretty-json&quot; or something like thi=
s. But<br>
now it is recommended to use new syntax:<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
logging/blob/master/docs/structured-logging.md__;!!HSntlCg!G61XcVxUr8Hli8Hq=
IlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66S0H6cseru6Bcw$">https://urldefense.com/v=
3/__https://github.com/openbmc/phosphor-logging/blob/master/docs/structured=
-logging.md__;!!HSntlCg!G61XcVxUr8Hli8HqIlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66=
S0H6cseru6Bcw$</a>
<br>
<br>
<br>
On Mon, 2021-09-06 at 09:40 +0000, Chris Chen (TPI) wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I guess this mail was got overwhelmed by bunches of emails, so please<=
br>
&gt; let me resend it and hope someone could help me. Another, I add one<br=
>
&gt; more question marked #5 below.<br>
&gt; <br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; <br>
&gt; =B1H=A5=F3=AA=CC: openbmc &lt;openbmc-bounces+chris.chen3=3Dflex.com@l=
ists.ozlabs.org&gt; =A5N=AA=ED<br>
&gt; Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
&gt; =B1H=A5=F3=A4=E9=B4=C1: 2021=A6~9=A4=EB2=A4=E9 =A4U=A4=C8 06:34<br>
&gt; =A6=AC=A5=F3=AA=CC: openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.=
org&gt;<br>
&gt; =A5D=A6=AE: [phosphor-host-ipmid] Questions about IPMI (OEM) command<b=
r>
&gt; development&nbsp;<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I have studied &quot;phosphor-host-ipmid&quot; package for a couple of=
 weeks and<br>
&gt; got understanding that it has implemented some mandatory and optional<=
br>
&gt; commands already. And I also knew that I'm able to leverage &quot;inte=
l-<br>
&gt; ipmi-oem&quot; package to get more command handlers. But there're some=
<br>
&gt; questions raised in my mind, I hope someone could give me some<br>
&gt; suggestions.<br>
&gt; &nbsp;&nbsp;&nbsp;1. What's the normal development procedure in case I=
 want to make<br>
&gt; our own OEM commands? I mean do you guys encourage me to create a new<=
br>
&gt; &quot;xxx-ipmi-oem&quot; package or to leverage &quot;intel-ipmi-oem&q=
uot; and then add our<br>
&gt; own commands in it?<br>
&gt; &nbsp;&nbsp;&nbsp;2. I for now added &quot;intel-ipmi-oem&quot; packag=
e only for using its<br>
&gt; &quot;&lt;Chassis&gt;:&lt;Set Front Panel Enables&gt;&quot; command be=
cause I figured out the<br>
&gt; same command in the&nbsp;&quot;phosphor-host-ipmid&quot; is not able t=
o match the d-<br>
&gt; bus interface in the &quot;x86-power-control&quot;. I'm not sure if I =
will need<br>
&gt; other commands in the &quot;intel-ipmi-oem&quot;, but what if I don't =
need other<br>
&gt; commands, how to remove them? to use the whitelist mechanism?<br>
&gt; &nbsp;&nbsp;&nbsp;3. Is it okay to add more than 1 xxx-ipmi-ome packag=
es? If yes, how<br>
&gt; to manage the whitelist between these 2 OEM packages?<br>
&gt; &nbsp;&nbsp;&nbsp;4. Am I able to use&nbsp;&quot;intel-ipmi-oem&quot; =
on a platform that is using AMD<br>
&gt; CPU?<br>
&gt; &nbsp;&nbsp;&nbsp;5. How to print the &quot;entry(&quot;SENDER=3D%s&qu=
ot;, sender.c_str())&quot; parts? I<br>
&gt; mean I for now can print out &quot;Set up ipmi context&quot; string af=
ter<br>
&gt; following the instruction listed in<br>
&gt; &quot;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/=
openbmc/openbmc/wiki/Debugging-OpenBMC*enabling-application-debug__;Iw!!HSn=
tlCg!G61XcVxUr8Hli8HqIlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66S0H6csVZtHYM2$
<br>
&gt; &quot;, but I don't see &quot;SENDER=3D&quot; when I executed &quot;jo=
urnalctl -t ipmid&quot;<br>
&gt; command.<br>
&gt; &nbsp;&nbsp;&nbsp;6.&nbsp;&nbsp;&nbsp; 1. log&lt;level::DEBUG&gt;(&quo=
t;Set up ipmi<br>
&gt; context&quot;,entry(&quot;SENDER=3D%s&quot;,sender.c_str()),&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;NETFN=3D0x%X&quot;, netFn),entry(&quot;LUN=3D0x%X&quot;, l=
un),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;<br>
&gt; entry(&quot;CMD=3D0x%X&quot;, cmd),entry(&quot;CHANNEL=3D%u&quot;, cha=
nnel),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
<br>
&gt; &nbsp; entry(&quot;USERID=3D%u&quot;, userId),&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;SESSIONID=3D0x%X&quot;, sessionId),&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;PRIVILEGE=3D%u&quot;,static_cast&lt;uint8_t&gt;(privilege)=
),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; &nbsp; &nbsp; entry(&quot;RQSA=3D%x&quot;, rqSA));<br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and<br>
&gt; confidential. <br>
&gt; It is intended to be read only by the individual or entity to whom it<=
br>
&gt; is addressed<br>
&gt; or by their designee. If the reader of this message is not the intende=
d<br>
&gt; recipient,<br>
&gt; is strictly prohibited. If you have received this message in error, <b=
r>
&gt; please immediately notify the sender and delete or destroy any copy of=
<br>
&gt; this message!<br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</div>
</span></font></div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR08MB5514D3E2103969E07D4F0AC7DCD39DM6PR08MB5514namp_--
