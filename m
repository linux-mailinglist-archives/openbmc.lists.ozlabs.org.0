Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BC91C7FCA
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 03:25:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HbNy3Lt1zDqwN
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 11:25:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2396237b89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=As6S8RS4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=QINPlU7h; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HbN644tKzDqv4
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 11:24:16 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0471LqJu005564; Wed, 6 May 2020 18:24:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=8OJPiWxyuEU40It3o5KRVOqCVST+kl9CBzu8iGZNZFk=;
 b=As6S8RS4JvzhOBsSLuSFpG/eufknQJ+CG5ROtI4+3azxNXS/bFhPKpINMGfliTMFeoRl
 CgBbgmcHNCIPVIDqyhiA5arCqa8kHOvBkvT4BOKs5drtxLJQ/QrqunAVUuiv+1A1e9x4
 7ecIeYV7Nag3hDiABI3zLLc0W0nMDjyVdEw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30up69djh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 May 2020 18:24:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 6 May 2020 18:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB1gswakOY1Axz17Czh9v3/pIZ5u5E+CNv9jBzKgC6WvHV5wN3VyoV/Q0fiRTb5U6jGBJJNqEJvbpxWlQUBQ0cGz00T7nRjgAWeu4l4ohkeMI9scmjgj4WrQcM6V9HbV72nSDgND2BBBqAllrjKWhuUqQTlmxhfBJkUpwv8pAYZJ/SmSfYeelOQCIcAJZDt43V6o+oL89doNBN61CpaZ27wVoxhNgsnXK4qgf97/eMFXS/54xxYbpZtLXRarPGTgziWtPuXawJ5E5uSnKa/12jzy1vpxHSf3th2vuNNeLySDtY/Yj7dtjEiUmyuDUyjn7lYetx+cFLbMRhXr4o2DrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OJPiWxyuEU40It3o5KRVOqCVST+kl9CBzu8iGZNZFk=;
 b=kB03b1SMJOmJGFhZLDgeR5gROyanRgOCU0gvwPuZp3HtepEntDQV5OY5x4OqfO7H/bw0dfc7KGT4/Kt/BYwqpAqF0wbKUDj/SY3xC5UInt95bd1bFUw0W49y1qgCuwS3o74AEHvZ9XrwFP8aLM+yiU0bfvfknVk5Gdo/gfJPOwPAsPBlnCWRsfnUrh5rS1cfvoMYlqoogIxEXHPTchAHkPvQMSHMmUjqYMihuDKP1kc9mdrJgFX/rAa/UCZZ6XEPiRWPBCjMl++OiaJI00rcGOxxNgSTP3VsNNiyFT7Tg9jxDXxyTYhRoFf8GPx9j8Df7zK4peqvjpcZ/BlLunkSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OJPiWxyuEU40It3o5KRVOqCVST+kl9CBzu8iGZNZFk=;
 b=QINPlU7haITFrinyTF0W6JtvzvZ9yJD60hanoAdhqBXC4f+kIrEFfL7/UYTkzVRy52hdWs631qbMqr7KdwmESHs+YuCzS42T62HU+tgHQFNilpEtjeSQp9+uGy6eqi4roL6I+go5j/cZ4Yy4tynZgS0iX9fhWPczmW9k+Wupvjg=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2535.namprd15.prod.outlook.com (2603:10b6:a03:151::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 01:23:54 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2958.033; Thu, 7 May 2020
 01:23:54 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: phosphor-health-monitor repo
Thread-Topic: phosphor-health-monitor repo
Thread-Index: AQHWJA4sk8meb7nphECQ9HJxRwpJWA==
Date: Thu, 7 May 2020 01:23:54 +0000
Message-ID: <13E6D0A2-69B1-4F89-92FA-F0A234682B28@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59818e98-81c1-4d37-8cf4-08d7f2254ec4
x-ms-traffictypediagnostic: BYAPR15MB2535:
x-microsoft-antispam-prvs: <BYAPR15MB2535C1AC8435818DA12C3F9ADDA50@BYAPR15MB2535.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uPg+mqTeuQg5eH6b5CgoYnz56aQTkJIdymt2AiVoF4P5h7ERsGEcWWXz8LDfOUKN3yiTX6OA8tVTkT841cLeiDNWNJJZWX5gR8OiDOn/VE24haMCrimNG9qcoTxdNJfEcIErosHQGhk6Ce5Bs7zBtJuFVYZmjXzMO7Hu/0Twn0sIZxBh2zMkcrFGFDOyakPtpa7wkXfjDRMOgyKpqRu25b3ZmT4JDskJYvW8MWjPz+3vHHTkHwn25bCSC2ziZaWnyG3rnkazpJvQZIempLmWdKPguJY+t30ZKhgbOXCjqLYAHbfiDfW0TeatD+zDSiGJDS5GJl1frExvjsC81VwQKaQKjdlk9Z59bDTvCLRndplVFfm8OKMfbGHaGtthWj/yDbvn+BI5s1MEPBxHYkEMa2HjPWRu8Qc450UCoUi8kLSf0TGsJ9fzix+J9wYm30QJqM7e29WeJil/9veOCGE0tdf4G1Mu+4UhOcNAWz+8S40SoHmr0aNrxAJQxewJP16OOOfhXZqu1cIO5JDJ1JYdTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(396003)(376002)(136003)(366004)(33430700001)(66946007)(2616005)(76116006)(86362001)(3480700007)(316002)(6512007)(2906002)(71200400001)(6506007)(4270600006)(186003)(66476007)(66446008)(64756008)(558084003)(66556008)(9326002)(5660300002)(33656002)(36756003)(8936002)(6916009)(6486002)(8676002)(478600001)(33440700001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4mo9Bwd5wTonL7S5UZc9YUf6ACcuhB/NTBDid/s8rAafXkN1bb5VdOtZKNbMPEnDHtprGXM3WCRVc6gqF8T3CCrlERdEkvkp6DPV1Wr8h1Vup0TDTSKT3xTCqWpiGJ+4gYq/6fjVZUPoZOwuYcmLCs+Lq8bg8oczBhv73oSHhz6/St8yYzw8qywlNXvDebkca9ERTPc8l9NjLBHDh2xW0Q/8EIpO+GpEyyR2rEYLlU3NbT2E5sWqggcSiud/oExhbl3jHYvnmu3OIDz0nuEWVD73kulNdjMrLQnCF8ttcjGqPaTTYCsZgRGzCvaxmVyDpujJTHrnkF4AKvEWU7H/REOK3DiOXL+n4fFi1tvATMf2Dld5MNHvaJxDDyShc14JCCleyiqZAuOYZZrKAOPoRMwvkHR3vc5tVUFUnzwvSn6HunaxbPcWqex1k6FLaIrVze4ptvvw42xMb+a63k6BLrD1rBbaQh3OBuWGFyS/HtBfuauJgKAfWKKZt576+o/6ZmhuXP2bU1Zvhl9cJf/m0+TAQR75XwJM+gSC8os8n9jvEZQn8UhGFs4j+TCeXZ1QdTO37eCyT/RPC9unPVjiiKHZrYj5HxWu+zBqbgw3rvxIpmIYW/n5rI/YeSRAhyTuce5XkuZ7flq3XsmRAIXPfh10QOc7jQ6zcsyfne3J72lDXmFGcLBG4gby2Wfwwkcg4AWovc0alzNhcLg/nYJi3qGgymkersaeHqC+Enk6ZUyf1055R7EFT6+ln6HTRwSoh1w/zrSQuD/0ik4RnFMw9gcNaygQZx3Gs2S6GS+1St4Skk4RUl6x93sn4CUBkPhflJRE/nRRqotNYiUVwRH9J8EKEGIe4fS8Q3nLsYmoPeg=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_13E6D0A269B14F8992FAF0A234682B28fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 59818e98-81c1-4d37-8cf4-08d7f2254ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 01:23:54.4041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzcOrOIl2Kl74aHbO5bQumeH/pf/EAMlPw18HRN0+UBZIslC745IX3zaYFRyANWv7d03GqyFKm3D+wTSuCwfhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2535
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-06_09:2020-05-05,
 2020-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=584
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070006
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

--_000_13E6D0A269B14F8992FAF0A234682B28fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCkNhbiB5b3UgcGxlYXNlIGNyZWF0ZSBhIG5ldyByZXBvIGZvciBwaG9zcGhvci1o
ZWFsdGgtbW9uaXRvci4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_13E6D0A269B14F8992FAF0A234682B28fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B0543DB3E61BE04AA546B095FABDE6D3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3
MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEJyYWQsPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNh
biB5b3UgcGxlYXNlIGNyZWF0ZSBhIG5ldyByZXBvIGZvciBwaG9zcGhvci1oZWFsdGgtbW9uaXRv
ci48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Jv
ZHk+DQo8L2h0bWw+DQo=

--_000_13E6D0A269B14F8992FAF0A234682B28fbcom_--
