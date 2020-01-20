Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 570341427DE
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 11:08:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481S682ypszDqhC
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 21:08:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481S5J4JKtzDqdl
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 21:07:15 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00KA4rxh080490
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 05:07:11 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmfy0jr9j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 05:07:10 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 20 Jan 2020 10:07:09 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Jan 2020 10:07:07 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00KA76jE44761254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jan 2020 10:07:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB04A404D;
 Mon, 20 Jan 2020 10:07:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5AC4A4057;
 Mon, 20 Jan 2020 10:07:05 +0000 (GMT)
Received: from [9.202.12.60] (unknown [9.202.12.60])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Jan 2020 10:07:05 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 james.feist@linux.intel.com
Subject: Redfish metadata implementation
Date: Mon, 20 Jan 2020 15:37:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------1930F37CA5F5178875080406"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20012010-0008-0000-0000-0000034B0918
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012010-0009-0000-0000-00004A6B6B29
Message-Id: <20116922-06a2-897c-55ba-d037675ea52e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-20_01:2020-01-20,
 2020-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=996 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001200088
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

This is a multi-part message in MIME format.
--------------1930F37CA5F5178875080406
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi James,

I was looking at the current master metadata redfish url implementation 
and seems that is not correct.

Currently redfish/v1 and redfish/v1/$metadata is giving the same service 
root data(service root).

curl -k -H "X-Auth-Token: $bmc_token" -X GET https://${bmc}/redfish/v1
curl -k -H "X-Auth-Token: $bmc_token" -X GET https://${bmc}/redfish/v1/$metadata

I am hoping the redfish/v1/$metadata should return the following data

https://github.com/openbmc/bmcweb/blob/master/static/redfish/v1/%24metadata/index.xml

Ratan




--------------1930F37CA5F5178875080406
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgogIDwvaGVhZD4KICA8Ym9keSB0
ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIDxwPkhpIEphbWVzLDwvcD4K
ICAgIDxwPkkgd2FzIGxvb2tpbmcgYXQgdGhlIGN1cnJlbnQgbWFzdGVyIG1ldGFkYXRhIHJl
ZGZpc2ggdXJsCiAgICAgIGltcGxlbWVudGF0aW9uIGFuZCBzZWVtcyB0aGF0IGlzIG5vdCBj
b3JyZWN0LjwvcD4KICAgIDxwPkN1cnJlbnRseSByZWRmaXNoL3YxIGFuZCByZWRmaXNoL3Yx
LyRtZXRhZGF0YSBpcyBnaXZpbmcgdGhlIHNhbWUKICAgICAgc2VydmljZSByb290IGRhdGEo
c2VydmljZSByb290KS48L3A+CiAgICA8cHJlIHN0eWxlPSJib3gtc2l6aW5nOiBpbmhlcml0
OyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4IDRweDsgLS1zYWYtMDpyZ2JhKHZhcigtLXNr
X2ZvcmVncm91bmRfbG93LDI5LDI4LDI5KSwwLjEzKTsgZm9udC1zaXplOiAxM3B4OyBsaW5l
LWhlaWdodDogaW5oZXJpdDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogY29udGV4dHVhbDsg
d2hpdGUtc3BhY2U6IHByZS13cmFwOyBvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyB3b3Jk
LWJyZWFrOiBub3JtYWw7IHRhYi1zaXplOiA0OyBmb250LWZhbWlseTogaW5oZXJpdDsgYm9y
ZGVyLXRvcC1jb2xvcjogOyBib3JkZXItdG9wLXN0eWxlOiA7IGJvcmRlci13aWR0aDogMHB4
OyBib3JkZXItcmlnaHQtY29sb3I6IDsgYm9yZGVyLXJpZ2h0LXN0eWxlOiA7IGJvcmRlci1i
b3R0b20tY29sb3I6IDsgYm9yZGVyLWJvdHRvbS1zdHlsZTogOyBib3JkZXItbGVmdC1jb2xv
cjogOyBib3JkZXItbGVmdC1zdHlsZTogOyBib3JkZXItaW1hZ2Utc291cmNlOiA7IGJvcmRl
ci1pbWFnZS1zbGljZTogOyBib3JkZXItaW1hZ2Utd2lkdGg6IDsgYm9yZGVyLWltYWdlLW91
dHNldDogOyBib3JkZXItaW1hZ2UtcmVwZWF0OiA7IGJvcmRlci1yYWRpdXM6IDBweDsgYmFj
a2dyb3VuZDogcmdiKDI1NSwgMjU1LCAyNTUpOyBjb2xvcjogcmdiKDI5LCAyOCwgMjkpOyB6
LWluZGV4OiAyOyBwb3NpdGlvbjogcmVsYXRpdmU7IG92ZXJmbG93OiB2aXNpYmxlOyAtd2Vi
a2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHRyYW5zcGFyZW50OyBmb250LXN0eWxlOiBub3Jt
YWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0
LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2lkb3dzOiAyOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29y
YXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsi
PmN1cmwgLWsgLUggIlgtQXV0aC1Ub2tlbjogJGJtY190b2tlbiIgLVggR0VUIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vJCI+aHR0cHM6Ly8kPC9h
PntibWN9L3JlZGZpc2gvdjEKY3VybCAtayAtSCAiWC1BdXRoLVRva2VuOiAkYm1jX3Rva2Vu
IiAtWCBHRVQgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6
Ly8kIj5odHRwczovLyQ8L2E+e2JtY30vcmVkZmlzaC92MS8kbWV0YWRhdGE8L3ByZT4KICAg
IDxwPkkgYW0gaG9waW5nIHRoZSByZWRmaXNoL3YxLyRtZXRhZGF0YSBzaG91bGQgcmV0dXJu
IHRoZSBmb2xsb3dpbmcKICAgICAgZGF0YTxicj4KICAgIDwvcD4KICAgIDxwPjxhIGNsYXNz
PSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL2JtY3dlYi9ibG9iL21hc3Rlci9zdGF0aWMvcmVkZmlzaC92MS8lMjRtZXRhZGF0YS9p
bmRleC54bWwiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9ibG9iL21hc3Rl
ci9zdGF0aWMvcmVkZmlzaC92MS8lMjRtZXRhZGF0YS9pbmRleC54bWw8L2E+PGJyPgogICAg
PC9wPgogICAgPHA+UmF0YW48YnI+CiAgICA8L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAg
ICA8cD48YnI+CiAgICA8L3A+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--------------1930F37CA5F5178875080406--

