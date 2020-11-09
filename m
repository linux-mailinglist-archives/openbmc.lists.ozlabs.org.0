Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674D2AB020
	for <lists+openbmc@lfdr.de>; Mon,  9 Nov 2020 05:05:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTy7p6TrZzDqcL
	for <lists+openbmc@lfdr.de>; Mon,  9 Nov 2020 15:05:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rameshi1@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AM/NqWpZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTy6n3wr7zDqNr
 for <openbmc@lists.ozlabs.org>; Mon,  9 Nov 2020 15:04:10 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A941a2R191871
 for <openbmc@lists.ozlabs.org>; Sun, 8 Nov 2020 23:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : message-id : content-type :
 content-transfer-encoding : subject; s=pp1;
 bh=RWadO5QqCP6yhetdLBVmLQeK8PcNfLb5+o+CxQ2U3c8=;
 b=AM/NqWpZZZmm4x3vHTKI9N04GFl1J8ORI8LhCwdkESWtBFFjPASIizJXZycqYwosHnWY
 wGBB2ds5/lRKTWORArGTHoPSUKg2nnbRuJ8/NVgm+OtuP9nXKI+YeHqgd5tE72GDJyZs
 356t+UD67qVDw9rrFbHlXwnuDzBDpOZDmknWbzn1Edb6QeTc3x1ALLZvd9LSZ2xkPm2j
 VF3QA1NyAexmugR13ZlkDgGBQwxYJIBGHbrpF6j4mNTjqod2KNo62pLLcrlPolyIDEAm
 w52508eGiepWWCSEviNRXD1kefoeaBBKPZ6qZUxbok/k5YjuFVtzhC33IOvGAVZsJ0Vf Ig== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.112])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34npsf2pk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 08 Nov 2020 23:04:06 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <rameshi1@in.ibm.com>;
 Mon, 9 Nov 2020 04:04:06 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.54) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 9 Nov 2020 04:04:04 -0000
Received: from us1b3-mail156.a3dr.sjc03.isc4sb.com ([10.160.174.110])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020110904040454-611 ; Mon, 9 Nov 2020 04:04:04 +0000 
In-Reply-To: <CALioo35DvdU8KsTJbB9RQiLQ+Md6gTW3TYeNy8qitVZLQzHK=A@mail.gmail.com>
From: "Ramesh I I1" <rameshi1@in.ibm.com>
To: tbnguyen1985@gmail.com
Date: Mon, 9 Nov 2020 04:04:04 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CALioo35DvdU8KsTJbB9RQiLQ+Md6gTW3TYeNy8qitVZLQzHK=A@mail.gmail.com>,
 <CALioo35rFrsCcK+j8GW8DCAHqw_y_r8e9cMg-SmNLQ5ydMajNg@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: 8D57E4C0:929A4052-0025861B:00159DF0;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 42287
X-TNEFEvaluated: 1
x-cbid: 20110904-4615-0000-0000-0000030E50E4
X-IBM-SpamModules-Scores: BY=0.172254; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410169; ST=0; TS=0; UL=0; ISC=; MB=0.002603
X-IBM-SpamModules-Versions: BY=3.00014158; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01461257; UDB=6.00786342; IPR=6.01243902; 
 MB=3.00034931; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-09 04:04:05
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-08 20:14:22 - 6.00012043
x-cbparentid: 20110904-4616-0000-0000-000003C827BA
Message-Id: <OF8D57E4C0.929A4052-ON0025861B.00159DF0-0025861B.00165862@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64
Subject: RE: phosphor-logging: entry() failed parse message.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_01:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdiBjbGFzcz0ic29jbWFpbGRlZmF1bHRmb250IiBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtZmFt
aWx5OkFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjEwcHQiID48ZGl2IGRp
cj0ibHRyIiA+SGkmbmJzcDtUaHUgTmd1eWVuLDwvZGl2Pgo8ZGl2IGRpcj0ibHRyIiA+Jm5ic3A7
PC9kaXY+CjxkaXYgZGlyPSJsdHIiID5CZWxvdyBsaW5rJm5ic3A7bWF5IGhlbHAgeW91Jm5ic3A7
dG8gZ2V0IG1vcmUgZGV0YWlsZWQgbG9nIHdoaWNoIHlvdSBhcmUgcmVmZXJyaW5nLjwvZGl2Pgo8
ZGl2IGRpcj0ibHRyIiA+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJt
Yy93aWtpL0RlYnVnZ2luZy1PcGVuQk1DI2pvdXJuYWxjdGwiID5odHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9vcGVuYm1jL3dpa2kvRGVidWdnaW5nLU9wZW5CTUMjam91cm5hbGN0bDwvYT48L2Rp
dj4KPGRpdiBkaXI9Imx0ciIgPiZuYnNwOzwvZGl2Pgo8ZGl2IGRpcj0ibHRyIiA+Rm9yIGV4YW1w
bGU6PC9kaXY+CjxkaXYgZGlyPSJsdHIiID5qb3VybmFsY3RsIC1vIGpzb24tcHJldHR5IE1FU1NB
R0U9IndhdGNoZG9nOiBUaW1lZCBvdXQiPC9kaXY+CjxkaXYgZGlyPSJsdHIiID4mbmJzcDs8L2Rp
dj4KPGRpdiBkaXI9Imx0ciIgPlJlZ2FyZHMsPC9kaXY+CjxkaXYgZGlyPSJsdHIiID5SYW1lc2g8
L2Rpdj4KPGJsb2NrcXVvdGUgZGF0YS1oaXN0b3J5LWNvbnRlbnQtbW9kaWZpZWQ9IjEiIGRhdGEt
aGlzdG9yeS1leHBhbmRlZD0iMSIgZGlyPSJsdHIiIHN0eWxlPSJib3JkZXItbGVmdDpzb2xpZCAj
YWFhYWFhIDJweDsgbWFyZ2luLWxlZnQ6NXB4OyBwYWRkaW5nLWxlZnQ6NXB4OyBkaXJlY3Rpb246
bHRyOyBtYXJnaW4tcmlnaHQ6MHB4IiA+LS0tLS0gT3JpZ2luYWwgbWVzc2FnZSAtLS0tLTxicj5G
cm9tOiBUaHUgQmEgTmd1eWVuICZsdDt0Ym5ndXllbjE5ODVAZ21haWwuY29tJmd0Ozxicj5TZW50
IGJ5OiAib3BlbmJtYyIgJmx0O29wZW5ibWMtYm91bmNlcytyYW1lc2hpMT1pbi5pYm0uY29tQGxp
c3RzLm96bGFicy5vcmcmZ3Q7PGJyPlRvOiBPcGVuQk1DIE1haWxsaXN0ICZsdDtvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcmZ3Q7PGJyPkNjOjxicj5TdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBwaG9z
cGhvci1sb2dnaW5nOiBlbnRyeSgpIGZhaWxlZCBwYXJzZSBtZXNzYWdlLjxicj5EYXRlOiBTYXQs
IE5vdiA3LCAyMDIwIDY6MTEgUE08YnI+Jm5ic3A7PGJyPjwhLS0gQmFObkVyQmxVckZsRS1IZUFk
RXItc3RhcnQgLS0+IDwhLS0gQmFObkVyQmxVckZsRS1IZUFkRXItZW5kIC0tPiA8IS0tIEJhTm5F
ckJsVXJGbEUtQm9EeS1zdGFydCAtLT4gPCEtLSBQcmVoZWFkZXIgVGV4dCA6IEJFR0lOIC0tPiAg
PCEtLSBQcmVoZWFkZXIgVGV4dCA6IEVORCAtLT4gPCEtLSBFbWFpbCBCYW5uZXIgOiBCRUdJTiAt
LT4KCjwhLS0gRW1haWwgQmFubmVyIDogRU5EIC0tPiA8IS0tIEJhTm5FckJsVXJGbEUtQm9EeS1l
bmQgLS0+Cgo8ZGl2IGRpcj0ibHRyIiA+PGRpdiBkaXI9Imx0ciIgPlRoZSBvdXRwdXQgaW4gQk1D
IGNvbnNvbGUgd2lsbCBiZToKPGRpdj5waG9zcGhvci13YXRjaGRvZ1s1MzRdOiB3YXRjaGRvZzog
VGltZWQgb3V0PC9kaXY+CjxkaXY+Jm5ic3A7PC9kaXY+CjxkaXY+UmVnYXJkcy48L2Rpdj4KPGRp
dj5UaHUgTmd1eWVuPC9kaXY+PC9kaXY+PC9kaXY+Jm5ic3A7Cgo8ZGl2PjxkaXYgZGlyPSJsdHIi
ID5PbiBTYXQsIE5vdiA3LCAyMDIwIGF0IDc6MzggUE0gVGh1IEJhIE5ndXllbiAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnRibmd1eWVuMTk4NUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIiA+dGJuZ3V5
ZW4xOTg1QGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjwvZGl2Pgo8YmxvY2txdW90ZSBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVm
dC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmct
bGVmdDoxZXgiID48ZGl2IGRpcj0ibHRyIiA+PGRpdiBkaXI9Imx0ciIgPkhpLAo8ZGl2PiZuYnNw
OzwvZGl2Pgo8ZGl2PkluIG9wZW5CbWMsIFdlIGFyZSB1c2luZyBwaG9zcGhvci1sb2dnaW5nLjwv
ZGl2Pgo8ZGl2PldoZW4gSSBsb2c6PC9kaXY+CjxkaXY+PGRpdiBzdHlsZT0iY29sb3I6cmdiKDIx
MiwyMTIsMjEyKTtiYWNrZ3JvdW5kLWNvbG9yOnJnYigzMCwzMCwzMCk7Zm9udC1mYW1pbHk6TWVu
bG8sTW9uYWNvLCZxdW90O0NvdXJpZXIgTmV3JnF1b3Q7LG1vbm9zcGFjZTtmb250LXNpemU6MThw
eDtsaW5lLWhlaWdodDoyN3B4O3doaXRlLXNwYWNlOnByZS13cmFwIiA+PGRpdj48c3BhbiBzdHls
ZT0iY29sb3I6cmdiKDIyMCwyMjAsMTcwKSIgPmxvZzwvc3Bhbj4mbHQ7PHNwYW4gc3R5bGU9ImNv
bG9yOnJnYig3OCwyMDEsMTc2KSIgPmxldmVsPC9zcGFuPjo6PHNwYW4gc3R5bGU9ImNvbG9yOnJn
Yig3OCwyMDEsMTc2KSIgPklORk88L3NwYW4+Jmd0Oyg8L2Rpdj4KPGRpdj48c3BhbiBzdHlsZT0i
Y29sb3I6cmdiKDIwNiwxNDUsMTIwKSIgPiJ3YXRjaGRvZzogVGltZWQgb3V0Ijwvc3Bhbj4sPC9k
aXY+CjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigyMjAsMjIwLDE3MCkiID5lbnRyeTwvc3Bh
bj4oPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigyMDYsMTQ1LDEyMCkiID4iQUNUSU9OPSVzIjwvc3Bh
bj4sIDxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMjIwLDIyMCwxNzApIiA+Y29udmVydEZvck1lc3Nh
Z2U8L3NwYW4+KDxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMTU2LDIyMCwyNTQpIiA+YWN0aW9uPC9z
cGFuPikuPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigyMjAsMjIwLDE3MCkiID5jX3N0cjwvc3Bhbj4o
KSksPC9kaXY+CjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigyMjAsMjIwLDE3MCkiID5lbnRy
eTwvc3Bhbj4oPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigyMDYsMTQ1LDEyMCkiID4iVElNRVJfVVNF
PSVzIjwvc3Bhbj4sIDxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMjIwLDIyMCwxNzApIiA+Y29udmVy
dEZvck1lc3NhZ2U8L3NwYW4+KDxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMjIwLDIyMCwxNzApIiA+
ZXhwaXJlZFRpbWVyVXNlPC9zcGFuPigpKS48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDIyMCwyMjAs
MTcwKSIgPmNfc3RyPC9zcGFuPigpKSw8L2Rpdj4KPGRpdj48c3BhbiBzdHlsZT0iY29sb3I6cmdi
KDIyMCwyMjAsMTcwKSIgPmVudHJ5PC9zcGFuPig8c3BhbiBzdHlsZT0iY29sb3I6cmdiKDIwNiwx
NDUsMTIwKSIgPiJUQVJHRVQ9JXMiPC9zcGFuPiwgPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigxNTYs
MjIwLDI1NCkiID50YXJnZXQ8L3NwYW4+LSZndDs8c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE1Niwy
MjAsMjU0KSIgPnNlY29uZDwvc3Bhbj4uPHNwYW4gc3R5bGU9ImNvbG9yOnJnYigyMjAsMjIwLDE3
MCkiID5jX3N0cjwvc3Bhbj4oKSkpOzwvZGl2PjwvZGl2PjwvZGl2Pgo8ZGl2PlRoZSBtZXNzYWdl
IGluIGVudHJ5KCkgaXMgbG9zdGVkLjwvZGl2Pgo8ZGl2PkRvIEkgbmVlZCB0byBhZGQgYW55IG9w
dGlvbiB3aGVuIGJ1aWxkaW5nPzwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PlRoYW5rcy48
L2Rpdj4KPGRpdj5UaHUgTmd1eWVuLjwvZGl2PjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48L2Rp
dj48L2Jsb2NrcXVvdGU+CjxkaXYgZGlyPSJsdHIiID4mbmJzcDs8L2Rpdj48L2Rpdj48QlI+Cgo=
