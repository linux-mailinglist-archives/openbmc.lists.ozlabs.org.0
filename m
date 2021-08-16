Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C06AD3ECD5B
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 05:53:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp0cq4qJcz30HM
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 13:53:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=fP5QuXAF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=286272d5ee=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=fP5QuXAF; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp0cF2FxQz2yRK
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 13:52:43 +1000 (AEST)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G3hAON006677; Mon, 16 Aug 2021 03:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=izsFJiKMx7mxrtiC8to1FhUvaGYx/7nEGKfAzMCHkEI=;
 b=fP5QuXAFY27x0Nu2G0OvqL8cBU2KHrub0304SkySPhUgTiSRcW6apN53O9c3RzMPhSL8
 MNpchvwh7ts+xFxAsqJk6lX1nK010pV/Ed1uqnfjpNUmhz6zHgEKyQ0JG++StX6pfmiP
 1alpmKDdBLZxHLRz3yO5bLX5DMy/z90oEEVfZwHn85Zm6kcXqkDgjLv+dvAts4YhhWcu
 BSLG8LfSRS3x/j8INeBgDdnhzkfpryW7tj+dKWnssgAL/asQRMIyRGh6bpahYvUYWUNt
 2qsJacew6r3E1Xr3tyBUUMXUtYYS8FqduRn/vZm2eHeb7s56AgpAKg2IO2WEptLNf3Ru 0g== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by mx07-002d6701.pphosted.com with ESMTP id 3ae4aqd0f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 03:52:36 +0000
Received: from BN8PR16CA0035.namprd16.prod.outlook.com (2603:10b6:408:4c::48)
 by DM5PR08MB2954.namprd08.prod.outlook.com (2603:10b6:3:14c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 03:52:33 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::58) by BN8PR16CA0035.outlook.office365.com
 (2603:10b6:408:4c::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 03:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.52)
 smtp.mailfrom=flex.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.52 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.52; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.52) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 03:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hh0Gc2arzTgU9cLlef/i1I4aKiupCMmLWfzIUvbmcBxNZAy3DL2jutY1pr2F42kuX90Sez5y+4UcVZB+bSLHDY8O6DVFTjRzPVZIe+c/JzQeJ/sHZbTNo8P+/B0FK2HUqIt6gRE16dCXpIXIcjgg0tlgvFCoVVq4rETrCZfSVCRmlVHZGFcQ+znNe/PC3YRNe+PKNdmJ6m1tKtuydJNgIknOx6cv7n3Ns+p7vdXtcM6o2vHv3VKAkGE/577TDNZlM5IZo8IuiFoQti7xRLu21Tu0VqmTsg8a0pytdRk4X58dTMV3gVuchaUwyP37Fo7i97IDicoFReH0jyiL27ZCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izsFJiKMx7mxrtiC8to1FhUvaGYx/7nEGKfAzMCHkEI=;
 b=HYYgndl+BCPdKE5VcJ9s1YKHIi0rAE86zuT681NxxR33JkksdVe189i9O+s80Dfkh9n2fh1fhSJw21TBAC7JoZRQRsVWq35MwaScuKJ1o2T+eeHLh+lOgRefPRwrxTfHweIFdNY3M79WfQq6BwvhMJStgAwHiS7/anPhn6+QpjD21K3kmP7aBQjq5q9OubVN3TnKbwRIR0p2dEMxLqAHh2jChwhgPAmZPEX/2yc0VL/JIWQ4O0z3t1jixVgeCQU24qZ43utYnDH0Q4iR84yTNrc0tWb8OfP20u+jrlHabV6AMBteB9ki12/FmFaVVWfel22Lnn3Gfs/K2opLziqeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4860.namprd08.prod.outlook.com (2603:10b6:5:45::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 03:52:31 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::1129:cf56:3e5d:251%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 03:52:31 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?utf-8?B?UkU6IOWbnuimhjogW3g4Ni1wb3dlci1jb250cm9sXTogcHJlc3MgdGhlIHBv?=
 =?utf-8?B?d2VyIGJ1dHRvbiBmb3IgYSBsb25nIHRpbWUgdGhhdCBjYW4ndCBmb3JjZSB0?=
 =?utf-8?Q?urn_off_system_power?=
Thread-Topic: =?utf-8?B?5Zue6KaGOiBbeDg2LXBvd2VyLWNvbnRyb2xdOiBwcmVzcyB0aGUgcG93ZXIg?=
 =?utf-8?B?YnV0dG9uIGZvciBhIGxvbmcgdGltZSB0aGF0IGNhbid0IGZvcmNlIHR1cm4g?=
 =?utf-8?Q?off_system_power?=
Thread-Index: AQHXf6gYYJZb/HtYO0+mc2S9Lrz5zKtRBZ8AgABlph2ABBERAIAgH6eg
Date: Mon, 16 Aug 2021 03:52:31 +0000
Message-ID: <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
In-Reply-To: <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fc8fd5b2-a26a-4424-fd1d-08d960694754
x-ms-traffictypediagnostic: DM6PR08MB4860:|DM5PR08MB2954:
X-Microsoft-Antispam-PRVS: <DM5PR08MB29549ECA9745910FA0615308DCFD9@DM5PR08MB2954.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BA+M+g48PIj3tEcpkqx35gIEz57X2tV7Ghe/jTbLu+hEBFRQxT5VKBkGXiGXE4XV+BavbVdkwcAQaWXIZLja43emGer8yf4i3rXpO3llNN37HDmPwNGH37y5RmTR0Jjtwawzuu2wZAHZ6pAXcOc1qh9o0CpTz4OE+VOsU9Pvs1tl/mOcJt2m4hPQRbhGXkV5t+N7J04KTlzAtFRLzQ3dHw5DAfdnBEVC5r3tNHyxfE0mmm2rvenf7usyrLIFeMQiLA+EQ0zkpEXQvDVVTA+GP9ZtFL2zG0FLyz/B59P5EQKz+V27MYQXKQ2+HNhnMl0aELBBQpNISFIH1R6zm3FyoeoC6bsLBHClgkvG2vVmyZiCxW0wiRigCE5pdVb1RIsgWHC06EHfmG9E0BPmQ4TfOdCcJk/MKdE7sKXOgvGsGoYDkOavkRdddfgDWrTSPT2VQoULh9PwIeqUIzxFV4smNI2WOkbhu9wV0qWjL76pXNR3yzCAc+CtsI7bm/JYqWcvsrDCHwAwCuoFwQgHMfIqvWPX7FOI3Z6ZD7y575maEMpqzSMQdqFiOvTbxyJxHN/we3QXHrs1kjv5VDSK9SrRAgxZvjAirdZK/I5bNRJkn7BwW0IDKRXJ3uVLMmS75+r9UcItPRl50PDUzgvYoLGBqFWlwn7v+WszOMTma2cPKQW7oJIJO02YRbLpCU/sx+Koc/tWT1vR7RNQqmHjcIKChg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(396003)(136003)(376002)(64756008)(2906002)(71200400001)(66476007)(66446008)(33656002)(55016002)(110136005)(38070700005)(66556008)(122000001)(38100700002)(8936002)(9686003)(52536014)(478600001)(76116006)(86362001)(66946007)(5660300002)(6506007)(186003)(224303003)(26005)(316002)(53546011)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bS9qU3NGSnV1ZTFkVmN3L3NPNEFkQ0ZNWW1jVGkzNU9Ia21hdGNZd1JMdi9w?=
 =?utf-8?B?dURxNnk1U2srUHhpUC9oODZ5K3IvWTQ0WXRvTnZaM1h2L01ZNUwzTVI5MHdH?=
 =?utf-8?B?K1NXNGsyUzZXeGFaYWRPNUhvcEdndUdsZzNrTlpvdXE4cUYva3V4ZUJqcksv?=
 =?utf-8?B?cWJwaTI0d1hwbFZITUtjdWVMUXFCNEpZN2VSUTd5M210dWVIWFNCV1VVZzhJ?=
 =?utf-8?B?NEhFeUk5Ny9iMUxmaDBpL3MzYlFoTHlSWlk1d0E3dS96VUFqdC9DejJvd1U2?=
 =?utf-8?B?NkNlQ1hMQ09tM2N0UUdaMW1pVHlkU3B1WVdyRjgxTzNxbDN2QkZvN3ZqTThx?=
 =?utf-8?B?VnBPMGhya0pjUnE5ajR0a0wxMXFtd3lRUDh4RTMwWDhpMVVCcG1KbktxRmdy?=
 =?utf-8?B?ZWl0aXFkYVpXOGU0TVJrNFdmdjA0YVVPSmlDTWE2V2drM1hoMmxJMUtTa3hL?=
 =?utf-8?B?N1VpcTZaOVczRkgyNmxzamJCcmRlT01sdlpaakt6NkVyMWhYMDdwZ3hpUG5H?=
 =?utf-8?B?Z1R5R1ZnbkwxaDlTY3BPY2ZKVzlsTnZRU1plckZ1bWVVZWdFVWQyRy9LOHBE?=
 =?utf-8?B?Zzd5TEhjZE10RjlFcmU3bVcvbStSU2NhTzlCc2Q0LytNL3Q0dEtUMjNGUmVz?=
 =?utf-8?B?akFWUVVnRDA0ZTkwZ21hVFpJOWJKM1RhNW0vSFg4UXlDTThRTHNZKzVjYjhK?=
 =?utf-8?B?VG5uTFUzSTVXNUR4QVo4SXp1bXVRVStxREp2SFhJMnFjMVVBZklleHFJOGxa?=
 =?utf-8?B?VmpuMzZaWStvTSttUUxzcnh2QWpFT00vUjBvQ3R1YVV4aEhiVDJlVTFKMXg0?=
 =?utf-8?B?MXFRTmVyaGI4MklBR1FkQWUvTHZrNG5veXFhZCthalZIS0pyRkRBUDR5WmxG?=
 =?utf-8?B?LzViWWdSc2JjM3ZjR283Umk4c01lRnRMaTVIcVJTV3lOQlNucElmSDMvVzVN?=
 =?utf-8?B?YTIxRjBqU1lISUJqUndkTi9Vd05PbUJZMThWRDRPSDloTjBITVV0V3JPUDlv?=
 =?utf-8?B?UW1wZlRyeS9yZW5xZDQ0M21raFovblB5VTZ5SnhtVGx2cEk5bWxtR0N1L0Fz?=
 =?utf-8?B?Wm5iUUZFZFpQUTlFL2xscEdYZ0I4aFpNck0wUnBWUzhrSjA3WUk5eVMrTkdn?=
 =?utf-8?B?dTVuNHM5Q1dGRkwrN1hJaTdOWStrak9qdzRqOGJrK1E2REEzVHNGR0NselhV?=
 =?utf-8?B?citGZGF5MzN4U29SQXlaTDBCak5sWVV2Sy9OamNURjdEWEdGZFl0aU9aMjlz?=
 =?utf-8?B?NDNSWXVLT2xuWklzeFJ5d01iQ2Z4SHR2RkRaa2VVT3ZaSUxPNjZWeHlpc0NE?=
 =?utf-8?B?cGlwMmZEMnVxMit2UzlhUjg5OVpkMklSUFN0K0hPUWgwWGNCZG1CNjZ1TGIy?=
 =?utf-8?B?eVhrNEVoZmVsRVFuUmNoVlkyMHdJcTV2NHNReE1tc3g4aXpFS1pYeG1yTitM?=
 =?utf-8?B?aklZTlpTUDRLMUJJcDRoOXdob3Y2bVZFdEdTWGtRRW5MUDNTVmV3cW4xdkNK?=
 =?utf-8?B?bTNNZkRWZ01hUWNaZFRyS1hTUHFUNkVsRFRKYnQ5KytOb1c5TnF1M1ZyTlFw?=
 =?utf-8?B?cUIzTDY3TEpjYit6TjVZN0xDVngyM0RuV1FSMkdrQ205eUhML0dBZzZVZHJY?=
 =?utf-8?B?azlwSFRPTG1ZRCsvY2NVb1FrTmF5L2UySlAxVUtzRXYxYWl6UGxyd1BhdnlI?=
 =?utf-8?B?dmFUcnF4UEZwNk1XR2d4RlFNdHlCeDR1alV1TlVXU1RlTDVMMGZIVmZlV05q?=
 =?utf-8?Q?0Q+1fopo3DvwFTvqYmWA6oXj3ssbl91iBxvmHat?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4860
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 19cfc8e0-10ba-4a78-adea-08d96069466d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loypr9Oazjk1/uhx4cFwBddXYSFw3CHtKYUfZ1nMcftlzkLWNXIbPPND2mcScwsTnKfVpz4MeO9qNA+l76st+W7jzvf0Rarv9Y+MGsycdlRiFKQ/Ktd0X4R8o5zpetcUT+PJhXbPjSxbqBMF+0WcabJRmVUPcqTxLRr6inLclb+vB19xWlUVkijQIewwUxC3JjAjm9ADn3oiQ3UqHSYc6iw2LdfmCvIXWjs8+MeX4bdNJYebQqkqdNejcaMoYLzOW9vE4IBnQ2omXI0uICVpgZDX5WPq5KE4eERdst0g++E07XrsP63+7UcdQaiF/LXmBg3BfusulHs5vcb/iSsTAzOVGsA6i4dVQ+l3zA1c8yLXJ5cc53ew7LEanqIwJ+SeEl46gCW/pUO0rv+cw9Cr8LmqkIKUAeqe+QIDvwNMlHkLf+o/V/C3tlr0ZnBKGwxAHmZ74ODDl3axZO3WV5Mg8UuDpkqKMFZfL/8yVZGw+bBkkO0IsiHt0FzUtwqamYxKPS05Me3C/xCPD1dr2gxPXKT9vpzl4clqXduCg1qSyt/Tft8vIj9dAK9MGUebkhRLMNniWW7Go2AmTMyv0YtgELtQWKy70Z/WDUECvlRerTBRUqurr7rUcCatBsSZhoAyc8rgHMMMthwGENBRd241pAAGpvCUothGrSYZjBupN1930g8211vLTaGEyQXs5uM/ycl39vcZKeRxVetK+T4RoYws3uTHIYaI+AMadbRrt8M=
X-Forefront-Antispam-Report: CIP:144.49.247.52; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(5660300002)(55016002)(9686003)(508600001)(8936002)(336012)(70206006)(53546011)(6506007)(52536014)(70586007)(7696005)(26005)(186003)(2906002)(4186021)(110136005)(86362001)(224303003)(356005)(82310400003)(81166007)(47076005)(316002)(83380400001)(36860700001)(33656002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 03:52:33.2801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8fd5b2-a26a-4424-fd1d-08d960694754
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.52];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2954
X-Proofpoint-ORIG-GUID: fKj2pA-n3ptWe_ud5bKjzK9bPSiTJf16
X-Proofpoint-GUID: fKj2pA-n3ptWe_ud5bKjzK9bPSiTJf16
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_01:2021-08-13,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160022
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

SGkgSmFzb24gYW5kIG90aGVycywNCg0KSSB0aGluayBJIGZpZ3VyZWQgb3V0IHRoZSBwcm9ibGVt
IGlzIHRoZSBHUElPUDAgYW5kIEdQSU9QMSBwYXNzdGhyb3VnaCB3YXMgbm90IHNldCBhZnRlciBz
eXN0ZW0gYm9vdGluZyB1cC4gSG93ZXZlciwgYXMgSSBtZW50aW9uZWQgd2hlbiByaXNpbmcgdGhl
IHF1ZXN0aW9uLCBJIGhhdmUgYWxyZWFkeSBzZXQgR1BJT1AwIGFuZCBQMSBwYXNzdGhyb3VnaCBp
biB1LWJvb3QsIGl0IGZvciBub3cgbG9va3MgbGlrZSB3YXMgYmVlbiB0dXJuZWQgb2ZmIGR1cmlu
ZyBLZXJuZWwgb3IgT3BlbkJNQyBhcHBsaWNhdGlvbiBydW5uaW5nIHVwLiBDYW4geW91IHBsZWFz
ZSBnaXZlIG1lIGEgY2x1ZSB3aHkgdGhlIEdQSU8gcGFzc3Rocm91Z2ggd291bGQgYmUgdHVybmVk
IG9mZiBvciB3aGVyZSBzaG91bGQgSSBuZWVkIHRvIGFkZCBwYXNzdGhyb3VnaCBzZXR0aW5nIGFn
YWluPw0KDQpUaGFua3MuDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrY2hyaXMuY2hlbjM9
ZmxleC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEJpbGxzLCBKYXNvbiBNDQpT
ZW50OiBUdWVzZGF5LCBKdWx5IDI3LCAyMDIxIDEyOjQ3IEFNDQpUbzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSZTog5Zue6KaGOiBbeDg2LXBvd2VyLWNvbnRyb2xdOiBwcmVz
cyB0aGUgcG93ZXIgYnV0dG9uIGZvciBhIGxvbmcgdGltZSB0aGF0IGNhbid0IGZvcmNlIHR1cm4g
b2ZmIHN5c3RlbSBwb3dlcg0KDQoNCg0KT24gNy8yMy8yMDIxIDk6MDQgUE0sIENocmlzIENoZW4g
KFRQSSkgd3JvdGU6DQo+IEhpIEphc29uLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHByb21wdCBy
ZXBseS4NCj4gDQo+IFRoZSBzeXN0ZW0gc3RheXMgb24sIGJlY2F1c2UgSSBjYW4gaGVhciB0aGUg
ZmFuIGluIFBTVSBpcyBzdGlsbCANCj4gcnVubmluZyBhbmQgQ1BVIGhlYXRzaW5rIGlzIGhvdCwg
YmVzaWRlcywgdGhlIGxvZyB3b3VsZCBzaG93ICJHcmFjZWZ1bCANCj4gcG93ZXItb2ZmIHRpbWVy
IGNvbXBsZXRlZCIgYW5kICJIb3N0MDogTW92aW5nIHRvICJPbiIgc3RhdGUiIGFmdGVyIDUgDQo+
IG1pbnV0ZXMuIEhlcmUgYXJlIGFsbCBsb2dzIG9mIHRoZSBwb3dlci1jb250cm9sIGZvciB5b3Vy
IHJlZmVyZW5jZS4gDQo+IEhvcGUgdGhpcyBjYW4gcHJvdmlkZSBtb3JlIGRldGFpbHMuDQpUaGUg
Qk1DIGRlcGVuZHMgb24gUFNfUFdST0sgZGUtYXNzZXJ0aW5nIHRvIGtub3cgdGhhdCB0aGUgc3lz
dGVtIGhhcyBzaHV0IGRvd24uICBJZiB0aGUgR3JhY2VmdWwgcG93ZXItb2ZmIHRpbWVyIGlzIGV4
cGlyaW5nLCBpdCBtZWFucyB0aGF0IHRoZSBCTUMgZGlkbid0IHNlZSBQU19QV1JPSyBkZS1hc3Nl
cnQuDQoNCkhvbGRpbmcgdGhlIHBvd2VyIGJ1dHRvbiBzaG91bGQgY2F1c2UgdGhlIHBvd2VyIGJ1
dHRvbiBvdmVycmlkZSBmb3JjZWQgc2h1dGRvd24gaW4gaGFyZHdhcmUuICBJdCBzb3VuZHMgbGlr
ZSB0aGlzIGlzbid0IGhhcHBlbmluZyBjb3JyZWN0bHkgb24geW91ciBzeXN0ZW0uICBJJ2Qgc3Vn
Z2VzdCByZWFjaGluZyBvdXQgdG8geW91ciBJbnRlbCByZXByZXNlbnRhdGl2ZSB0byBnZXQgaGVs
cCBpbnZlc3RpZ2F0aW5nIHdoYXQgaXMgaGFwcGVuaW5nIGluIHRoZSBoYXJkd2FyZSB0byBwcmV2
ZW50IHRoZSBwb3dlciBidXR0b24gb3ZlcnJpZGUgZnJvbSBmdWxseSBzaHV0dGluZyBkb3duIHRo
ZSBzeXN0ZW0uDQoNCj4gDQo+ID09PT09DQo+IHJvb3RAaHVkc29uYmF5LW9ibWM6fiMgam91cm5h
bGN0bCB8IGdyZXAgLWUgInBvd2VyLWNvbnRyb2wiIC1lICJwb3dlciANCj4gY29udHJvbCIgLWUg
IlBvd2VyIENvbnRyb2wiDQo+IEp1bCAyNCAxMDozNjowNiBodWRzb25iYXktb2JtYyBzeXN0ZW1k
WzFdOiBTdGFydGluZyBJbnRlbCBQb3dlciBDb250cm9sLi4uDQo+IEp1bCAyNCAxMDozNjowOSBo
dWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IFN0YXJ0IENoYXNzaXMgcG93ZXIgDQo+
IGNvbnRyb2wgc2VydmljZS4uLg0KPiBKdWwgMjQgMTA6MzY6MDkgaHVkc29uYmF5LW9ibWMgc3lz
dGVtZFsxXTogU3RhcnRlZCBJbnRlbCBQb3dlciBDb250cm9sLg0KPiBKdWwgMjQgMTA6MzY6MDkg
aHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBOTUlfT1VUIHNldCB0byAwIA0KPiBK
dWwgMjQgMTA6MzY6MDkgaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBQT1dFUl9P
VVQgc2V0IHRvIDEgDQo+IEp1bCAyNCAxMDozNjowOSBodWRzb25iYXktb2JtYyBwb3dlci1jb250
cm9sWzE5OF06IFJFU0VUX09VVCBzZXQgdG8gMSANCj4gSnVsIDI0IDEwOjM2OjA5IGh1ZHNvbmJh
eS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogTk1JIFNvdXJjZSBQcm9wZXJ0eSANCj4gTW9uaXRv
ciBKdWwgMjQgMTA6MzY6MDkgaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiANCj4g
SW5pdGlhbGl6aW5nIHBvd2VyIHN0YXRlLg0KPiBKdWwgMjQgMTA6MzY6MDkgaHVkc29uYmF5LW9i
bWMgcG93ZXItY29udHJvbFsxOThdOiBIb3N0MDogTW92aW5nIHRvICJPbiIgDQo+IHN0YXRlDQo+
IEp1bCAyNCAxMDozNjowOSBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IFBPSCB0
aW1lciBzdGFydGVkIA0KPiBKdWwgMjQgMTA6MzY6MzggaHVkc29uYmF5LW9ibWMgcG93ZXItY29u
dHJvbFsxOThdOiBwb3dlclN0YXRlT246IFBPU1QgDQo+IENvbXBsZXRlIGFzc2VydCBldmVudCBy
ZWNlaXZlZCBKdWwgMjQgMTA6MzY6MzggaHVkc29uYmF5LW9ibWMgDQo+IHBvd2VyLWNvbnRyb2xb
MTk4XTogTm8gYWN0aW9uIHRha2VuLg0KPiBKdWwgMjQgMTA6MzY6NDEgaHVkc29uYmF5LW9ibWMg
cG93ZXItY29udHJvbFsxOThdOiBwb3dlclN0YXRlT246IFBPU1QgDQo+IENvbXBsZXRlIGRlLWFz
c2VydCBldmVudCByZWNlaXZlZCBKdWwgMjQgMTA6MzY6NDEgaHVkc29uYmF5LW9ibWMgDQo+IHBv
d2VyLWNvbnRyb2xbMTk4XTogSG9zdDA6IE1vdmluZyB0byAiQ2hlY2sgZm9yIFdhcm0gUmVzZXQi
IHN0YXRlIEp1bCANCj4gMjQgMTA6MzY6NDEgaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsx
OThdOiBXYXJtIHJlc2V0IGNoZWNrIHRpbWVyIA0KPiBzdGFydGVkIEp1bCAyNCAxMDozNjo0MSBo
dWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IA0KPiBSZXN0YXJ0Q2F1c2Ugc2V0IHRv
IA0KPiB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkhvc3QuUmVzdGFydENhdXNlLlNvZnRSZXNl
dA0KPiBKdWwgMjQgMTA6MzY6NDEgaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBI
b3N0IHN5c3RlbSBEQyANCj4gcG93ZXIgaXMgb2ZmIEp1bCAyNCAxMDozNjo0MSBodWRzb25iYXkt
b2JtYyBwb3dlci1jb250cm9sWzE5OF06IFBPSCANCj4gdGltZXIgY2FuY2VsZWQgSnVsIDI0IDEw
OjM2OjQxIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogDQo+IGZhaWxlZCB0byBy
ZXNldCBBQ0Jvb3QgcHJvcGVydHkgSnVsIDI0IDEwOjM2OjQyIGh1ZHNvbmJheS1vYm1jIA0KPiBw
b3dlci1jb250cm9sWzE5OF06IFdhcm0gcmVzZXQgY2hlY2sgdGltZXIgY29tcGxldGVkIEp1bCAy
NCAxMDozNjo0MiANCj4gaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOg0KPiBwb3dl
clN0YXRlQ2hlY2tGb3JXYXJtUmVzZXQ6IHdhcm0gcmVzZXQgZGV0ZWN0ZWQgZXZlbnQgcmVjZWl2
ZWQgSnVsIDI0IA0KPiAxMDozNjo0MiBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06
IEhvc3QwOiBNb3ZpbmcgdG8gIk9uIg0KPiBzdGF0ZQ0KPiBKdWwgMjQgMTA6MzY6NDIgaHVkc29u
YmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBQT0ggdGltZXIgc3RhcnRlZCANCj4gSnVsIDI0
IDEwOjM2OjQyIGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XTogSG9zdCBzeXN0ZW0g
REMgDQo+IHBvd2VyIGlzIG9uIEp1bCAyNCAxMDozODoxNiBodWRzb25iYXktb2JtYyBwb3dlci1j
b250cm9sWzE5OF06IA0KPiBwb3dlclN0YXRlT246IFBPU1QgQ29tcGxldGUgYXNzZXJ0IGV2ZW50
IHJlY2VpdmVkIEp1bCAyNCAxMDozODoxNiANCj4gaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJv
bFsxOThdOiBObyBhY3Rpb24gdGFrZW4uDQo+IEp1bCAyNCAxMDozODozNCBodWRzb25iYXktb2Jt
YyBwb3dlci1jb250cm9sWzE5OF06IFBvd2VyQ29udHJvbDogcG93ZXIgDQo+IGJ1dHRvbiBwcmVz
c2VkIEp1bCAyNCAxMDozODozNCBodWRzb25iYXktb2JtYyBwb3dlci1jb250cm9sWzE5OF06IA0K
PiBwb3dlclN0YXRlT246IHBvd2VyIGJ1dHRvbiBwcmVzc2VkIGV2ZW50IHJlY2VpdmVkIEp1bCAy
NCAxMDozODozNCANCj4gaHVkc29uYmF5LW9ibWMgcG93ZXItY29udHJvbFsxOThdOiBIb3N0MDog
TW92aW5nIHRvICJHcmFjZWZ1bCANCj4gVHJhbnNpdGlvbiB0byBPZmYiIHN0YXRlIEp1bCAyNCAx
MDozODozNCBodWRzb25iYXktb2JtYyANCj4gcG93ZXItY29udHJvbFsxOThdOiBHcmFjZWZ1bCBw
b3dlci1vZmYgdGltZXIgc3RhcnRlZCBKdWwgMjQgMTA6NDM6MzQgDQo+IGh1ZHNvbmJheS1vYm1j
IHBvd2VyLWNvbnRyb2xbMTk4XTogR3JhY2VmdWwgcG93ZXItb2ZmIHRpbWVyIGNvbXBsZXRlZCAN
Cj4gSnVsIDI0IDEwOjQzOjM0IGh1ZHNvbmJheS1vYm1jIHBvd2VyLWNvbnRyb2xbMTk4XToNCj4g
cG93ZXJTdGF0ZUdyYWNlZnVsVHJhbnNpdGlvblRvT2ZmOiBncmFjZWZ1bCBwb3dlci1vZmYgdGlt
ZXIgZXhwaXJlZCANCj4gZXZlbnQgcmVjZWl2ZWQgSnVsIDI0IDEwOjQzOjM0IGh1ZHNvbmJheS1v
Ym1jIHBvd2VyLWNvbnRyb2xbMTk4XTogDQo+IEhvc3QwOiBNb3ZpbmcgdG8gIk9uIg0KPiBzdGF0
ZQ0KPiA9PT09PQ0KPiANCj4gVGhhbmtzLg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXMgQ2hlbg0K
PiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAtLQ0KPiAq5a+E5Lu26ICFOiogb3BlbmJtYyA8b3BlbmJt
Yy0NCj4gYm91bmNlcytjaHJpcy5jaGVuMz1mbGV4LmNvbUBsaXN0cy5vemxhYnMub3JnPiDku6Po
oaggQmlsbHMsIEphc29uIE0NCj4gPGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPg0KPiAq
5a+E5Lu25pel5pyfOiogMjAyMeW5tDfmnIgyNOaXpSDkuIrljYggMDQ6MzYNCj4gKuaUtuS7tuiA
hToqIG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K
PiAq5Li75peoOiogUmU6IFt4ODYtcG93ZXItY29udHJvbF06IHByZXNzIHRoZSBwb3dlciBidXR0
b24gZm9yIGEgbG9uZyB0aW1lIA0KPiB0aGF0IGNhbid0IGZvcmNlIHR1cm4gb2ZmIHN5c3RlbSBw
b3dlcg0KPiANCj4gDQo+IE9uIDcvMjMvMjAyMSA0OjI4IEFNLCBDaHJpcyBDaGVuIChUUEkpIHdy
b3RlOg0KPj4gSGkgYWxsLA0KPj4gDQo+PiBJIGFtIHdvcmtpbmcgb24gYW4gYXN0MjYwMCB3aXRo
IEludGVsIENQVS4NCj4+IFRoZSBzeXN0ZW0gcG93ZXIgY3VycmVudGx5IGlzIGFibGUgdG8gdHVy
biBvbiBkdXJpbmcgUGhvc3Bob3IgT3BlbkJNQyANCj4+IGJvb3QgdXAgYWZ0ZXIgSSBjb21wbGV0
ZWQgd29ya3MgZm9sbG93aW5nOg0KPj4gDQo+PsKgIDEuIGVuYWJsZSBBQ1BJIGluIHUtYm9vdA0K
Pj7CoCAyLiBzZXQgR1BJT1AwIH4gUDMgcGFzcy10aHJvdWdoIGluIHUtYm9vdA0KPj7CoCAzLiBw
b3J0aW5nIEVTUEkgZHJpdmVyIGZyb20gQVNUIFNESyB2Ni4wMSB0byBsaW51eC1hc3BlZWQgcmVw
b3NpdG9yeQ0KPj7CoCA0LiBhZGQgIiZncGlvMCIgd2l0aCBncGlvLWxpbmUtbmFtZXMgd2hpY2gg
aGFzIFBPV0VSX0JVVFRPTiwgDQo+PlBPV0VSX09VVCwNCj4+wqDCoMKgwqAgU0lPX1MzLCBTSU9f
UzUsIGV0Yy4gZGVmaW50aW9uIGluIHRoZSBkdHMsIEkgdGhpbmsgdGhlDQo+PsKgwqDCoMKgICJ4
ODYtcG93ZXItY29udHJvbCIgcmVwb3NpdG9yeSByZXF1aXJlZCB0aGVzZS4NCj4+wqAgNS4gYXBw
ZW5kICJ4ODYtcG93ZXItY29udHJvbCIgYW5kICJpbnRlbC1pcG1pLW9lbSIgcmVwb3NpdG9yaWVz
IHRvIA0KPj5pbWFnZQ0KPj4gDQo+PiBIb3dldmVyLCBJIGFsd2F5cyBvbmx5IGdvdCB0aGUgZm9s
bG93aW5nIGxvZ3Mgd2hlbiBJIHByZXNzZWQgdGhlIA0KPj4gcG93ZXIgYnV0dG9uIGZvciBhIGxv
bmcgdGltZSAoPiA0cykuDQo+PiA9PT09PQ0KPj4gcG93ZXItY29udHJvbFsyNjNdOiBQb3dlckNv
bnRyb2w6IHBvd2VyIGJ1dHRvbiBwcmVzc2VkDQo+PiBwb3dlci1jb250cm9sWzI2M106IHBvd2Vy
U3RhdGVPbjogcG93ZXIgYnV0dG9uIHByZXNzZWQgZXZlbnQgcmVjZWl2ZWQNCj4+IHBvd2VyLWNv
bnRyb2xbMjYzXTogSG9zdDA6IE1vdmluZyB0byAiR3JhY2VmdWwgVHJhbnNpdGlvbiB0byBPZmYi
IA0KPj4gc3RhdGUNCj4+IHBvd2VyLWNvbnRyb2xbMjYzXTogR3JhY2VmdWwgcG93ZXItb2ZmIHRp
bWVyIHN0YXJ0ZWQgPT09PT0NCj4+IA0KPj4gSXQgZG9lc24ndCBvY2N1ciAiU0lPX09OQ09OVFJP
TCB2YWx1ZSBjaGFuZ2VkOiAxIC0+IFNJTyBwb3dlciBnb29kIA0KPj4gZGUtYXNzZXJ0IGV2ZW50
IHJlY2VpdmVkIiwgZXRjLiBvcGVyYXRpb25zIGFuZCB0aGVuIHRvIHR1cm4gb2ZmIHRoZSBwb3dl
ci4NCj4+IA0KPj4gQ2FuIGFueW9uZSBkbyBtZSBhIGZhdm9yIHRvIGdpdmUgbWUgc29tZSBjbHVl
cyBmb3Igd2hhdCBJIHdhcyB3cm9uZz8NCj4gSGkgQ2hyaXMsDQo+IA0KPiBIb2xkaW5nIHRoZSBw
b3dlciBidXR0b24gc2hvdWxkIGZvcmNlIGEgaGFyZHdhcmUgc2h1dGRvd24uwqAgVGhlIEJNQyAN
Cj4gb25seSBtb25pdG9ycyB0aGlzIGZsb3cgYW5kIGRvZXNuJ3QgcGFydGljaXBhdGUuDQo+IA0K
PiBEaWQgeW91ciBzeXN0ZW0gc2h1dCBkb3duIGNvcnJlY3RseSBhbmQgeW91IGp1c3Qgbm90IHNl
ZSB0aGUgbG9ncyBpbiANCj4gQk1DP8KgIE9yLCBkaWQgdGhlIHN5c3RlbSBzdGF5IG9uPw0KPiAN
Cj4gVGhhbmtzLA0KPiAtSmFzb24NCj4+IA0KPj4gDQo+PiBUaGFuayB5b3UgaW4gYWR2YW5jZSBm
b3IgeW91ciBoZWxwLg0KPj4gDQo+PiBSZWdhcmRzLA0KPj4gQ2hyaXMgQ2hlbg0KPj4gDQo+PiBM
ZWdhbCBEaXNjbGFpbWVyIDoNCj4+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBt
ZXNzYWdlIG1heSBiZSBwcml2aWxlZ2VkIGFuZCANCj4+IGNvbmZpZGVudGlhbC4NCj4+IEl0IGlz
IGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8g
d2hvbSBpdCANCj4+IGlzIGFkZHJlc3NlZCBvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJl
YWRlciBvZiB0aGlzIG1lc3NhZ2UgaXMgDQo+PiBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwg
eW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIA0KPj4gb2YgdGhpcyBtZXNz
YWdlLCBpbiBhbnkgZm9ybSwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgDQo+
PiByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIHBsZWFzZSBpbW1lZGlhdGVseSBub3Rp
ZnkgdGhlIHNlbmRlciANCj4+IGFuZCBkZWxldGUgb3IgZGVzdHJveSBhbnkgY29weSBvZiB0aGlz
IG1lc3NhZ2UhDQo=
