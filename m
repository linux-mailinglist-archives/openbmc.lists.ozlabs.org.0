Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E419A231
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 01:02:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sPwQ3kJwzDqtR
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 10:01:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Fr4W2B6d; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=UFhtIGae; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sPvf0clTzDq6l
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 10:01:17 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VMxFsf004975; Tue, 31 Mar 2020 16:01:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=BAPYGSXoDpFrGiYfUiSmVrxYrwNQVyJYlgL2sRHZdVc=;
 b=Fr4W2B6dS55pnq7fnIMHMteo5pM6BPLNcUkZbEqfCbgzO9k47tNDujp6nvFAX2XXG2VI
 W7XCTw0p+ZJpjsM2H3Vt+UZzFP76T/QCXU6hEgY3naGwFcziYRVQHWipVIPR6C9xIiiK
 Z0item6YsSAV8K02UD8euuZlHFhfSWxDVZs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 304c9aru7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 16:01:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 16:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt+tJxt//MXZgn4QTNHGTXB0YHzPYbfTn6q1TGMqLtofdU+fweAKt9D/UvMrLqPtDhm/rT/d/176zX/Uz3SqBOdFkdRV1HYQgw/CLMjZaSsa+JV1mLgsw7viiwJ63SFWxLxBgx2dKBlSLUhXYCX6hBQYHqwoGH5r2p7vGDm7QvkLIz4uVeCQf4CE67MgWjsONM2PZIJTt3Fqc8dkw1cZXpD7ofr4qBA7xFPEjaKkzSF2PCA88gzl63t0Y6OwsTUZS7fBn8iUKBRqcHd88nxmWN3lGH9Iw6Hw2hi0lf0gnX5lMFnlnCXcXuK/QSLCWWcglDBMa0mWHF6p11n/peYTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAPYGSXoDpFrGiYfUiSmVrxYrwNQVyJYlgL2sRHZdVc=;
 b=m/zRmsVLneRH56ePD93LgWD3tegm/5S1KGoAQJ/BQ1AORIUSJ34dHWw2llzdnPx2YW99QyGz6u4HdA/O/uHhrs07DfoTEJtqnuZSacSLxB1CA2rTacRXWYiCD+ZWUM9yGx8NJCmSMWbIvC+TczSMS6arLUELBP8giPh0ZofpnG99gp+W3qcuL+7c7ej1BhfZWT8iXBP/S6bL+LIRYn3YlE86Opbt6iVBIUA3wRyFThyNVnXQu8gnfAf6UWZWBikFiRLzVO+ywFVvbjkea9pVA5lU7fwekMmkIQfL5a+7r4XheB3U8qlWxh3K4juS82j8Bw/eFao5086O4rr7DMfujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAPYGSXoDpFrGiYfUiSmVrxYrwNQVyJYlgL2sRHZdVc=;
 b=UFhtIGaet9CC6vsqlPuRU10cPumgPekUa2H9NPlDbKybml0MHsVAT12IyJlpAqprMimV6cfm8Tpq1g93MfYBb6aT/j+H1nr7STwscyr4Q9Rt1etEEJ3e05QB9p+vPhZfe1+iZPAK9URpnYuGOu2Jfb9OumzcsTGPM48Ao2M2ONo=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3804.namprd15.prod.outlook.com (2603:10b6:303:49::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Tue, 31 Mar
 2020 23:01:11 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 23:01:11 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>
Subject: Review restart cause
Thread-Topic: Review restart cause
Thread-Index: AQHWB7BFqaQb3hkqmUegJl4VvMXPww==
Date: Tue, 31 Mar 2020 23:01:11 +0000
Message-ID: <D274947A-FC7A-4731-B3A7-65B0FB407391@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36ce323a-133d-407a-7a4c-08d7d5c76820
x-ms-traffictypediagnostic: MW3PR15MB3804:
x-microsoft-antispam-prvs: <MW3PR15MB3804D62019E13BF484F94A4DDDC80@MW3PR15MB3804.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(396003)(376002)(39860400002)(346002)(76116006)(71200400001)(8676002)(81156014)(66556008)(558084003)(81166006)(66476007)(64756008)(7116003)(4326008)(6916009)(8936002)(316002)(66446008)(66946007)(966005)(91956017)(6486002)(478600001)(9326002)(5660300002)(6512007)(2906002)(2616005)(86362001)(186003)(36756003)(33656002)(6506007)(3480700007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O1htYdl5sKuEUkMFLe/AUTKtjvqsQd+gZZuwxek1SBoj6GfRtrqavjPkpwzLXdFmKPpwjuPLghiv1LvyuczGiZqc16DiN95aT/4Ue4Vph7aWuZi/7a+UiaJ0nYNuG2A23zRzYyXsVkuk/AtqtCzl0zg5zINKCERg0qZLjNuTF+A/sZ5v5TTORbrcN8/zzPFeoe2XF88N2hgnsfADWvc/iSfCOOcXG4Wh1g8Wed2gOrkdObTbxmNGVycI9phNb3Wa21AQe9x4MSXc/EIXkAHM3ITbG31DwHT7E06TTt4Gwp3SI4s22t56J5LM+QYEn6dE/j2dJs4GL28h/saoVrRHFyoDSifmuddgKD9Ydo7gt9NKIkT8V9iOrtHCU6GBfjNIw2zNxANeklB9u0zbmn0V2/is4K4cQ+wfJRdYTUu80CS0+tqSZGkgLDUbsdRLrx2yKj8ppP4aZGeIq/5k2EV7CRLUlkhGmzm89CLYUVgY6BziJVRx8iY5+21scZTm3vUx8O6ueGNFUd881hazRP/tbw==
x-ms-exchange-antispam-messagedata: hlqekaHpfbYkuQejhop8JrO2XyZnYVj+Rtl3FWu1PRD+7MZGZzOxrzpXPY7oQ5UW+RgQbBJ/yCfIp9xlrom0HOJHIhoCDiBZDnYBHTvHDG5U457XS7BKOvARZzqt0nac7nMA4YWdHE/YxGLEr5MbmK2Lk5awBRGwJ5TNoHgoPnaN1YTEa1OnsDldoQGNhEen4JQFRGbtwf4KW1g2dd/4mw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_D274947AFC7A4731B3A765B0FB407391fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ce323a-133d-407a-7a4c-08d7d5c76820
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 23:01:11.6908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dM0HoChVqGjUBplGnKS+tZvgrQXcaktodpVfSSWVmg8x9r3+jKq1FS1PpZdUu4J5K7zqKqc1X2nufmAHkky4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3804
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=508 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310187
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_D274947AFC7A4731B3A765B0FB407391fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVmVybm9uLA0KQ2FuIHlvdSBwbGVhc2UgY29tcGxldGUgZm9sbG93aW5nIHJldmlldywgSSBo
YXZlIGluY29ycG9yYXRlZCBldmVyeXRoaW5nIGZyb20gcmV2aWV3IGZlZWRiYWNrLg0KaHR0cHM6
Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9waG9zcGhvci1ob3N0LWlw
bWlkLysvMjk5NjIvDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_D274947AFC7A4731B3A765B0FB407391fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <1B9D1ABBE040F44B87878648B27D3B35@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxl
MTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2Fs
aWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJ
e21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJn
aW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldv
cmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hh
cGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlm
XS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQi
Pg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94
bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjND
MSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSBWZXJub24sPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPkNhbiB5b3UgcGxlYXNlIGNvbXBsZXRlIGZvbGxvd2luZyByZXZpZXcs
IEkgaGF2ZSBpbmNvcnBvcmF0ZWQgZXZlcnl0aGluZyBmcm9tIHJldmlldyBmZWVkYmFjay48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YSBocmVmPSJodHRwczov
L2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVuYm1jL3Bob3NwaG9yLWhvc3QtaXBt
aWQvJiM0MzsvMjk5NjIvIj5odHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9v
cGVuYm1jL3Bob3NwaG9yLWhvc3QtaXBtaWQvJiM0MzsvMjk5NjIvPC9hPjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_D274947AFC7A4731B3A765B0FB407391fbcom_--
