Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE511173E90
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 18:31:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Tc5t4XvgzDrP4
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 04:31:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=0327bd19d5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=kk/TiMEl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=aJ1multT; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Tc515g61zDrMc
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 04:30:40 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SHPFmh012137; Fri, 28 Feb 2020 09:30:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=MsJX8SjWontmnUOVAwwQoXLhRyk/BNtoCAPPzU7BJzE=;
 b=kk/TiMElyhUFM8tHAXZhhqGxdKSglROuiPUqjbXa3VGIujMAIR2QSyREBoxeaHS8Om/8
 Uu8c0mcXWLMLFIAckJzt2rchGVUGgsqyLz22MsVbLO5GY3sd284rbWg0YlO6+M/lxfs6
 Z+Z6N23j0XlJjjPnbAQBSNLAOXabldjm50M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2yeputvcm1-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 28 Feb 2020 09:30:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 28 Feb 2020 09:30:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6jhR2+ifMdsk764/8LbIoyPhgLosc5x85Y+813ifQB3rhFqqwIzqbxcqOdH3xCKnEOx1wZQ8RhrZWSGqdwLEF/p6xFt3ijJXPJ0T06QGepuS7QAQ2HK37T2Em3+vHkC+tybaE/WqDHbphdF/uVVQQKuHEJR8RVI95Ij85vrt+nLs4OEo+AmCGgwMfRlVMMM9hbdo8VhbPES3jHIwfnm2yRuTnxdKSmJXzjajLDHqSmjrV19zYwj+rK1ESPIasrN/UI7evz/EMPb3lr30qm3XV89Fns1u4SOTakbFCXcrUSlWp5D5JwZ0mOxREv3Z10yhPSAi8xm7HsHw+dGeRb0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsJX8SjWontmnUOVAwwQoXLhRyk/BNtoCAPPzU7BJzE=;
 b=lnLS6uJhWaJEZ3BJv6xjtC8r0daJEmXU16fLtGdyOwhvffszvlytKgumbMyRKqn1sPP9/VmSO+rQ+gB5SeWkklQZqyysSsX43hJYpgcoUvt42rhj7rdIHZxAoisGPCCtmeVe81sewIzeX/MZvSV798SLE05gs2cV3lUPXDs/Y1SjleGjIqUICFnnOSzIckhG9fq/4Ag/nxJ5aWFQPVyMfuwsgsP0i/tRBmZY8DvH+/zfz7lj+YprdE7PgcVeeUTc8I+aZNiYZy4GWN2yg3icTzXO2g5Oz7Jw35SZSGizXPTSHX6F0SKVwkBkz0v4+webcJ+FASY1BpytjMb+tr8aJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsJX8SjWontmnUOVAwwQoXLhRyk/BNtoCAPPzU7BJzE=;
 b=aJ1multTq4LljRGJtJZ3quxh20JJSQyRdTc9ZsAnFjIhHboiosF8O0Oqw4k419PNfGSjIhpMKydK2NnZdpZx6EEJxUl7UTUpT87o2a6W7E0uJgFkWvVfp2C2jPzbUT0I+ivZhljAZlYHCUorcetZNa9qA9NPoM0LyNMB+mZrV3k=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3900.namprd15.prod.outlook.com (2603:10b6:303:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Fri, 28 Feb
 2020 17:30:02 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.018; Fri, 28 Feb 2020
 17:30:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: www <ouyangxuan10@163.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [OpenBMC]: How to get the update progress when flashing BMC
 firmware?
Thread-Topic: [OpenBMC]: How to get the update progress when flashing BMC
 firmware?
Thread-Index: AQHV7gzHgYeEqeJ8+UOkOFLzpm6ASqgwVzEA
Date: Fri, 28 Feb 2020 17:30:01 +0000
Message-ID: <9B1332BB-7D2B-4BB9-9EE0-1EC1D5FD1E8A@fb.com>
References: <2042ec12.4c6e.1708abdbe56.Coremail.ouyangxuan10@163.com>
In-Reply-To: <2042ec12.4c6e.1708abdbe56.Coremail.ouyangxuan10@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:9940]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4798d619-dd12-46c0-48f6-08d7bc73d79f
x-ms-traffictypediagnostic: MW3PR15MB3900:
x-microsoft-antispam-prvs: <MW3PR15MB39007B0FCBCB8BF670FF4668DDE80@MW3PR15MB3900.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(346002)(376002)(136003)(189003)(199004)(186003)(6506007)(478600001)(2906002)(2616005)(53546011)(15650500001)(86362001)(71200400001)(316002)(33656002)(110136005)(76116006)(66476007)(66556008)(81156014)(5660300002)(8936002)(6486002)(6512007)(4744005)(64756008)(36756003)(81166006)(8676002)(66946007)(66446008)(15583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3900;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2k41S9HYki9TrbWueaOGvQT4ozYILqMdbNLJsjlUJPAjbOucH3QCuFCUVZFeoQh4UZHo2vRq0u3QdCX3tI9FVRLZGeJmvOuxB4ntq/P3MH00243tRGZdRIsKCwiDQjtfloReWNeL1PxWGf7IkXvwG8oksPNvBqbXuzVGW8Q1lbwpQmlJfhFc8bq5ai2pMXUCihMJq2O/ai0o1ak6oYsmPzzwwV0UqHTTehI0juzyu6u/hI7lq6UgqBVNIqVb9rueoZahl7nT1IZM99aFVNryJN1uMfniC7HX1m3KWpeUytqC4NNu/azddZ9DHxHxaNdzkA4BD6sQz71SF4E//dG4KD5ubxH6sReSFWauMSzkekH/Yj8iQYMPOhrbfUEBu8bkeRymWhTN0AsCJHQExkyDzw3WXYKP/+YdZ1x37QCoFH6b+wheuBlGWV9oBUtPS+cv6//b4XGu4ZbgHJrkZ/oRyjIcygzEI/xDblWgg48WBr+1GZuFRsv5QGouzRXIrUwO
x-ms-exchange-antispam-messagedata: ezSIutVb8Ge9RkUPumA37uZOS3geu8KzIUDBUpo2GHeYmUa8o0qGX3b5wHWmjMGN8szYyBf0UoDXvPg4V1xNlTgp3sKG47wDaAiFXehOlHIsvDAaYgCIj9tmwGlcssOd5EQJ4TBYdxLFAIPxChR4SVGg+HY94H1Uwb6e4L6S3enKGsLA1BORR6osM31ENulh
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_9B1332BB7D2B4BB99EE01EC1D5FD1E8Afbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4798d619-dd12-46c0-48f6-08d7bc73d79f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 17:30:01.9223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zXcM2FXlC/QxRM7OiQhuhXMIyumnaOZ3GICL1QUh2Y6ANdxIlxWutLqssZBiMMQza/Fx/TxEH+8hv/JrHponA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3900
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_05:2020-02-28,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280134
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

--_000_9B1332BB7D2B4BB99EE01EC1D5FD1E8Afbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBkb27igJl0IHRoaW5rIHRoZXJlIGlzIG11Y2ggdG8gc2hvdyBhcyBwcm9ncmVzcyB3aGVuIGJt
YyB1cGdyYWRlIGhhcHBlbnMuIEJlY2F1c2UgYWN0dWFsIGZsYXNoIHdyaXRlIGhhcHBlbnMgZHVy
aW5nIHJlYm9vdCBhbmQgdGhhdCB0aW1lIGV2ZXJ5IG90aGVyIHByb2Nlc3Mgd291bGQgYmUgZG93
biBJIGd1ZXNzLg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiB3d3cgPG91eWFuZ3h1YW4xMEAx
NjMuY29tPg0KRGF0ZTogVGh1cnNkYXksIEZlYnJ1YXJ5IDI3LCAyMDIwIGF0IDExOjU3IFBNDQpU
bzogIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4N
ClN1YmplY3Q6IFtPcGVuQk1DXTogSG93IHRvIGdldCB0aGUgdXBkYXRlIHByb2dyZXNzIHdoZW4g
Zmxhc2hpbmcgQk1DIGZpcm13YXJlPw0KDQpoae+8jA0KDQpIb3cgdG8gZ2V0IHRoZSB1cGRhdGUg
cHJvZ3Jlc3Mgd2hlbiBCTUMgaXMgZmxhc2hpbmcuIEl0IGNhbiBiZSBkaXNwbGF5ZWQgb24gd2Vi
dWkuDQoNCnRoYW5rcywNCkJ5cm9uDQoNCg0KDQoNCg0K

--_000_9B1332BB7D2B4BB99EE01EC1D5FD1E8Afbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D0154B9584D6044B9228B2D4CBB306F8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiTVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4
IDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9z
ZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxp
YnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9u
dC1mYW1pbHk6IlxATVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4IDIgNDt9
DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2
Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250
LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4u
RW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFt
aWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERl
ZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9
DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGlu
IDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlv
bjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2
M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+SSBkb27igJl0IHRoaW5rIHRoZXJlIGlzIG11Y2ggdG8gc2hvdyBhcyBw
cm9ncmVzcyB3aGVuIGJtYyB1cGdyYWRlIGhhcHBlbnMuIEJlY2F1c2UgYWN0dWFsIGZsYXNoIHdy
aXRlIGhhcHBlbnMgZHVyaW5nIHJlYm9vdCBhbmQgdGhhdCB0aW1lIGV2ZXJ5IG90aGVyIHByb2Nl
c3Mgd291bGQgYmUgZG93biBJIGd1ZXNzLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3Jk
ZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xv
cjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtj
b2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0Mzt2aWpheWtoZW1rYT1m
Yi5jb21AbGlzdHMub3psYWJzLm9yZyZndDsgb24gYmVoYWxmIG9mIHd3dyAmbHQ7b3V5YW5neHVh
bjEwQDE2My5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPlRodXJzZGF5LCBGZWJydWFyeSAyNywg
MjAyMCBhdCAxMTo1NyBQTTxicj4NCjxiPlRvOiA8L2I+JnF1b3Q7b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnJnF1b3Q7ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3Vi
amVjdDogPC9iPltPcGVuQk1DXTogSG93IHRvIGdldCB0aGUgdXBkYXRlIHByb2dyZXNzIHdoZW4g
Zmxhc2hpbmcgQk1DIGZpcm13YXJlPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8
ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Ymxh
Y2siPmhpPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZx
dW90O01TIEdvdGhpYyZxdW90Oztjb2xvcjpibGFjayI+77yMPC9zcGFuPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7
Y29sb3I6YmxhY2siPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5
OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6YmxhY2siPjxvOnA+Jm5ic3A7PC9v
OnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNh
bnMtc2VyaWY7Y29sb3I6YmxhY2siPkhvdyB0byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3aGVu
IEJNQyBpcyBmbGFzaGluZy4gSXQgY2FuIGJlIGRpc3BsYXllZCBvbiB3ZWJ1aS48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5z
LXNlcmlmO2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVw
dDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj50
aGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+Qnlyb248bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KPGJyPg0K
PGJyPg0KPG86cD48L286cD48L3A+DQo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PC9ib2R5Pg0KPC9odG1sPg0K

--_000_9B1332BB7D2B4BB99EE01EC1D5FD1E8Afbcom_--
