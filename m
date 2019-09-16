Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E3B41E6
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 22:33:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XHxb4wPTzDqMF
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 06:33:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4162a39c11=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WSMHczbg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Zg3Z6hj6"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XHwq6s4XzDqQ0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 06:32:26 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8GKT2NN006967
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 13:32:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=QOPPWYscyZP0wMq1NiMS8FgNs7z4UmmIhohWtn5Tk4g=;
 b=WSMHczbgyks/j3Qb5HQTEcj6yoCOrgt5/+9xE3ysGdy/MCJk862Cl/WqSVYedrz8SPrW
 MPisosfLpQjowa/ibfUVjMEziPGiHuq9ETVO7oDyhydz/jwl9q7lq1nyBd7Mdy8zYfA6
 wJ4p+TEKdR24TAGssS2w9x0qaWj0ylK8NdM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v20ry3u9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 13:32:22 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Sep 2019 13:32:21 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Sep 2019 13:32:21 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Sep 2019 13:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBskmuSfCZ7nK7bjCzq/AjBYMg0Pc6wtj1EU4naTKacF4FnAZQV+mAQsbrdgCL4XLxVELE48NlGW7mSr3nUkd1a/ne2fG8COk3mcYEj3QPJNOqpM/mWQBPil9DM3PjAKliNv0R9IIEBME8sieD1AJ9HSxwUNxkwbOZ4qTg7YSin8SgFajxlu59mvYukVbX8kfZq5StrM97tTCNNg4KBHrCf5PQCdoHgyEAth1gjGuUnFCuFj38mGGaYMx5/O7xyh9/NMzGesUPRJvPWOO5EZx00NW0652mBljcnwoKgugIhh+8REQAFxk3zz2leXbzW6kxBEzZb2UQDUU/ZUu/UHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOPPWYscyZP0wMq1NiMS8FgNs7z4UmmIhohWtn5Tk4g=;
 b=Z/vcoVe61W+GCc5+f/QhR3ah/gwMaJL17lyF6KAY2cbXFT29fo+I0jrFPdSMU58yhI5zfwrsn8SRoLF9AjHEO1xyDDawSVarswihikVdlbDbqCrS5KmxZQU973JI7vhrpLYr11SyfEiYR36Ezf0nJDD0uhcdPMVeaqR09FMVaU9cdxnlme74NA7PzoKOH8fHO2aR5r79B2pVYnWNazABz9Q01Y11wzmLZWuT+lbFNPsDBcqq9mK8nx0/bRdGQL3Ly708hO+KlYfPDsMTTsAG1qepAsSDRr7kBeVsfGHwkGYdx/+5XKi3x48dUFLdrTjphh9E/A/f0Y3DD1dMmshBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOPPWYscyZP0wMq1NiMS8FgNs7z4UmmIhohWtn5Tk4g=;
 b=Zg3Z6hj6PdHhl7BYBlNn0xfSuPfRl9APt0AZx1i9rD1C/sCOU3FnU+FLBMb2yPArxCxp1NClSz/1zqjVGxKlw/Iga5keEYcSFZrj7cnip03LHnXNa0Gp4rtM+qDAxUp3ad1PO+4pQI5R0UcaJfiTVw0HRFgyGtYvm+/tNfMR4yc=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1709.namprd15.prod.outlook.com (10.174.97.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Mon, 16 Sep 2019 20:32:20 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 20:32:20 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SSD/NVMe Temperature Sensors 
Thread-Topic: SSD/NVMe Temperature Sensors 
Thread-Index: AQHVbM3WUyuiKxwc70aKccHc6HrpvA==
Date: Mon, 16 Sep 2019 20:32:20 +0000
Message-ID: <A9A91E7E-5709-42BD-AF7E-28831309A05D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:7bc5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 919c77b0-1d32-42a7-06e8-08d73ae4f92e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1709; 
x-ms-traffictypediagnostic: MWHPR15MB1709:
x-microsoft-antispam-prvs: <MWHPR15MB1709735C43D2AB642CAB0F05BD8C0@MWHPR15MB1709.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(376002)(366004)(136003)(396003)(51874003)(189003)(199004)(36756003)(305945005)(7736002)(2616005)(478600001)(99286004)(486006)(66476007)(66446008)(66556008)(76116006)(256004)(66946007)(33656002)(14454004)(2351001)(64756008)(25786009)(6916009)(4743002)(316002)(81166006)(86362001)(8936002)(8676002)(81156014)(6116002)(2501003)(2906002)(1730700003)(6486002)(558084003)(53936002)(46003)(5640700003)(6436002)(6512007)(6506007)(102836004)(3480700005)(71200400001)(5660300002)(186003)(71190400001)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1709;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n2GlKwVCVNrXOyBdNUqYJ0x7R5C7pi8U/cLU5MpCQWakHfho42BoUbsU1mUjmxFyxNtOIsHtUHdjgbucIV5Hfp5ngws8qM2kIvjZ6twbVvpoEX2vcnr321K+lV/OpV34VQpile9DLFSLrChQUWjkNsnoBhO9pQrQns2UNEXeKr46bSaiKWlgX454fxs+HpCRPrSRzAnVcEQJnhs5BjMnYH6E7Be7TjeKRNIcRRPWq1rdDsiZYT8o8pKoAtptGI+oOWK4fF4SStZkmhtTModMbF0Wt/nETXqoM31J4/VQo5PHgruIZiD2EqlnxYljKch8yIWecGBp6QPe0PfvEsIL5eG2e4/WzUzDGcY+sn9cSV4flTBzmiwdu+WlY3zgDkBUNhfDA87suTSh7QdqCxGTmfOz22WK0CoYwxbNz2CAVkA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <392FDBDE2F0DD64F85947D21F87BA3CA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 919c77b0-1d32-42a7-06e8-08d73ae4f92e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 20:32:20.1753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xf8adjEYMnz5X6p1AddWRzRbiuMya58gc0i1KfjO0JxPJkubLNVbtez+wcCXcMUP3GYSdv6Se2MIVrHbA8qNwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1709
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-16_08:2019-09-11,2019-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=618 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909160201
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

Has anyone done work on gathering temperature information from these device=
s? Links appreciated.

Thanks in advance,

Wilfred=
