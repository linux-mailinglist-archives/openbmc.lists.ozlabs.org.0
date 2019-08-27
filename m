Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 395539F215
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 20:11:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hxkn0WB5zDqtR
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 04:10:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3142c170a7=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="FGZdkGvN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DHKpvXn4"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hxjv33vvzDqqJ
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 04:10:03 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7RI9sre021743
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 11:09:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=xTE19Te9wdDYZEPDdOm3Ek/vQuDT2xm+z8pc8Ny7vzs=;
 b=FGZdkGvNZD8+oeuCVAvWmNLjY4W6Oswg+QbKUdz8Ok0H/lYMSsyE1DlqR8ITN8sZl8OY
 9lvqmN5IghcwWp+QYupQE5aUvppNBApiPUSOFtsbaMsJtRLEU7URD+6TznU+mfsFft6e
 6Dd1/wezCe6lNLHtmEyNO5MPLoMlfl2Wwds= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2umrdrv6c2-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 11:09:59 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Aug 2019 11:09:29 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Aug 2019 11:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl+ob3fLEf76ZW/7+jo2WUNxWzTWoobKNXxNm4FXSV4WtckwXh9hh/Fgfmmt93ukY9YkXMJ6NgSdDeRVXXeO60894emfFOIY1HFs/5iHJG6nVqa3/vJElbeRZsjc4akCwj9FMZ4GO4jI7Gq+8rfd0Iu3xVs70b9QeCLizRBGmTmGx2bZ/t9w9KrtTSBlq579S+7KV69OOZjq2sEsDlkMhwcu6GnV2OUXUq5+b+qrtTGK0UVzTeDadtqEmegIOVhU1tIyfMXGAUr9guOH4gD7FsTWS2Um2O1qe02NC1n50zK4Fmn7+Ho52Ek3zZz2FyckAE1P4xjl3gQ6+Xc2kESmQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTE19Te9wdDYZEPDdOm3Ek/vQuDT2xm+z8pc8Ny7vzs=;
 b=CECvEPH1+tN/L5rIditRsCJ9fDQQkmlXSG6t0ar9a3aFBJMD3lBHPZfrUaboEw98aGPWWLPrV2buD0zH4+OBRp9gCbmjiFB0lBCwXjlawQaM/xO5aGVSsfAeD46nhyu1tbEArQS1Uumo7MtIDrVpoAX0CB3XDnWHHt3IitGXDecRpX1CvyZug0tsVbVRXFPoB6eT85OpqT87AtLs3vbiex2SdvcQF4QxO0AU3ZF3ENQqwxL8dBvlwjHqzAI8EO44lZSbjoSOAs6QD9MUC0TargVDXI3iIFN005cn5T90KT9sTHeF0jTRSvBErYmseq7XeBUSxQn9pfMUM9IeffsUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTE19Te9wdDYZEPDdOm3Ek/vQuDT2xm+z8pc8Ny7vzs=;
 b=DHKpvXn4720ESA+8o++bsKxDT1x9ta7aLGYZkyPoREPB1+bYW7rh/eYJGYPQ95O6Tjn+Hf7Gi67GSm/grTZot/yzg5uTa2Y9MJZaDxRzTSl718BIXmjwkw1/XrZhapAJRloI4RzUod0LcJ5NJcY+4tJE4JaDuG0CGcJJLNsO6T8=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB3008.namprd15.prod.outlook.com (20.178.253.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 18:09:28 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2199.020; Tue, 27 Aug 2019
 18:09:27 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: D-Bus Performance
Thread-Topic: D-Bus Performance
Thread-Index: AQHVXQKQwp/h1hMpy0OAUhp7yKYV0A==
Date: Tue, 27 Aug 2019 18:09:27 +0000
Message-ID: <94DBCEDA-576E-41EE-9284-78F9D2B990E5@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:c573]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7e53a27-c90d-4775-4b10-08d72b19b35d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB3008; 
x-ms-traffictypediagnostic: MN2PR15MB3008:
x-microsoft-antispam-prvs: <MN2PR15MB30088CE47F9C8EDDD46467D6BDA00@MN2PR15MB3008.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(39860400002)(366004)(346002)(199004)(189003)(256004)(99286004)(6506007)(6486002)(186003)(2616005)(6512007)(46003)(2501003)(486006)(53936002)(316002)(2351001)(476003)(102836004)(558084003)(25786009)(6436002)(33656002)(2906002)(5640700003)(81166006)(81156014)(1730700003)(8936002)(91956017)(76116006)(66946007)(5660300002)(14454004)(86362001)(6116002)(66446008)(36756003)(478600001)(6916009)(3480700005)(8676002)(71190400001)(305945005)(71200400001)(7736002)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3008;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UrMvfFuRJLGrDL4XdUHj+6YAeC2O8OWtGKszYkLzrP310OAPYTWL0fB1t0uBrcF0B5crx/Ou7Z5acQWZxpuGBLC9p0vSsCTxxOhJpTgGMZG2+IgTgG6CCRXELeuUmk2OTd5XzDZQ6FJpdzm/sKMfkaoxz4zxEytTBj7N4V3anxwLm/dFHZVintD4LMfdxYatc5xbirqryCYxni4FrVws4Bh3r7Jy3temvnxO/jYNFYu+0uWITtMz784FRsiVFTZxt5udbX7BVj0VGgaMVPsCE7e9zGwTiDwAglajxUc4Zcka9eqLJ+0BA+ery0hHzmYwNoDYa8WTjluUyTyt9M4WhnDmyQiLHEAwHnqfCalMrkkEDICXVtSZe5nQLDTT/019RqEHVeT16HgcV6B3U1Ll28s6ae8WSqSIn1puvz0UWB8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69BE398311FA2A43A5136E2E8BA8FC13@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e53a27-c90d-4775-4b10-08d72b19b35d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 18:09:27.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rr8j10gbJQWvDwGkWkozz4oWrT1/HYqg7vohm3KNwpCpBFVuLtkYvAZqPGKhAZ6nBp79EaSVxteDqmks4Xrdhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3008
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-27_03:2019-08-27,2019-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=650 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1908270176
X-FB-Internal: deliver
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

I hear someone is working on measuring/optimizing D-Bus Performance and may=
 have published their findings regarding best practices for clients and ser=
vices.

Please advise.

Wilfred=
