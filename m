Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE9E9C7E16
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 23:06:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpcmS4PSvz3g1X
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 09:05:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.97.181.73
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731477856;
	cv=none; b=i5g+td9eX+oa4H219UOleMmvShGdOBU2DrE1N3jLpaGYWTMSpnpgcV33Tzo7betvEuZqFlYVd8EM2L4Wxulc/z2lyHDn04ESY6JtsxJiyqJAyOucBi3lUunp44CPy36I+LqNWup6tQdkw2KeWuhJ2pzJdpl+5Xa3fs2AI3umN1sl9gT3p2nVydIZmHhZfcKrX+NLnFz24q9/Eji0SzuLfznfzJ9iZYQjvezR9zBkd7xJRHg5uZZHvsWuyN83ZtzLyttHBcGoA/jwi0lmDBdah70D9oHGWr3F6LAu88ODm5RLaBpHfm9ISUhtTvzOmcF7v4qfWFmyWZ47P6ao2EXJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731477856; c=relaxed/relaxed;
	bh=8pKd4LpvVscxjJ4Jx8AQbjmDxA3pXWNLVZeiKAjUpnI=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ehZ2dWM3rA2FEObb4X8QEaMprn8TDAtp3qgDNYDOL5cGGfk5UpGlMZW5v21bNiQWwIwg/lLT/+NUP4cg9lqM5EjWcbybnYXUevPbfiGSVdDP3vHmHINpWTi1t6ErnjiJxdzYD9VNAWB9c/zU44kJjsUNJuoJIkKLgDI4Mlg4asuhlg0eTbavG34KyzrjbgXuIwbpBU1Mwon6hQbcc2ZAn+3kQX8KdhcxRV7JTfhDpmtPtxUzTwZEh+7n4GHaglyl1zXa6R3n6+UA+qmqNclKEwI4tz9703szL0iDF0rR+9eAe2JcljNvUoq/biC4X1SXnndD8VmRrW0Uu/f/2lxZDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass (client-ip=209.97.181.73; helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net; envelope-from=yubowei0982@phytium.com.cn; receiver=lists.ozlabs.org) smtp.mailfrom=phytium.com.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=phytium.com.cn (client-ip=209.97.181.73; helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net; envelope-from=yubowei0982@phytium.com.cn; receiver=lists.ozlabs.org)
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpCQx34b6z2xks
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 17:03:58 +1100 (AEDT)
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwDHz_NFQTRn9JcUAQ--.29528S2;
	Wed, 13 Nov 2024 14:03:49 +0800 (CST)
Received: from yubowei0982$phytium.com.cn (
 [240e:469:611:8755:1cbd:467:9101:36df] ) by ajax-webmail-mail (Coremail) ;
 Wed, 13 Nov 2024 14:03:48 +0800 (GMT+08:00)
X-Originating-IP: [240e:469:611:8755:1cbd:467:9101:36df]
Date: Wed, 13 Nov 2024 14:03:48 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5Za75p+P54Kc?= <yubowei0982@phytium.com.cn>
To: openbmc@lists.ozlabs.org
Subject: Re: BMCWEB debug question
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT6 build
 20240812(cfb32469) Copyright (c) 2002-2024 www.mailtech.cn
 mispb-4edfefde-e422-4ddc-8a36-c3f99eb8cd32-icoremail.net
In-Reply-To: <18393666.6642.1931e8207af.Coremail.yubowei0982@phytium.com.cn>
References: <18393666.6642.1931e8207af.Coremail.yubowei0982@phytium.com.cn>
X-CM-CTRLDATA: CvZrlmZvb3Rlcl9odG09Nzc1NDo0Njg=
Content-Type: multipart/alternative; 
	boundary="----=_Part_103972_1665195754.1731477828051"
MIME-Version: 1.0
Message-ID: <607cb6f4.693a.193241ef1d4.Coremail.yubowei0982@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwDHHntFQTRn5VpPAA--.8785W
X-CM-SenderInfo: 51xe04lhlqmmus6sx5pwlxzhxfrphubq/1tbiAQAHE2cyYBACrAAC
	sc
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=yubowei098
	2@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7Aw15XrW8JFW7CF1rXrW5Jrb_yoW8KFW3pF
	ZIya4xZw47Xw1xGrWrKa1I9a4aqr97Gr47G3s5Gr18AFsrWr12yasFv3yYva43Cr1qyr1j
	vw1agF1DurZ8CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 14 Nov 2024 09:05:26 +1100
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

------=_Part_103972_1665195754.1731477828051
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

V2FpdHRpbmcgZm9yIHlvdXIgcmVwbHksdGhhbmtzIQoKCgoKCgoKLS0tLS3ljp/lp4vpgq7ku7Yt
LS0tLQrlj5Hku7bkuro65Za75p+P54KcIDx5dWJvd2VpMDk4MkBwaHl0aXVtLmNvbS5jbj4K5Y+R
6YCB5pe26Ze0OjIwMjQtMTEtMTIgMTE6NTQ6MTggKOaYn+acn+S6jCkK5pS25Lu25Lq6OiBvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmcK5Li76aKYOiBCTUNXRUIgZGVidWcgcXVlc3Rpb24KCgoKSGVs
bG8scG0KCgoKCkVhY2ggdGltZSBkZWJ1Z2luZyBhIGZ1bmNpb24gb2Ygb25lIGxpbmUgY29kZSB3
aWxsIGNvc3QgbWUgdG9vIG11Y2ggdGltZS4KMS50eXBlICJiaXRiYWtlIGJtY3dlYiIsdGhpcyBh
Y3Rpb24gd2lsbCBjb3N0IG1lIDUgbWludXRlcy4KMi5SZXBsYWNlIGJtY3dlYiBiaW5hcnkgZmls
ZS4KMy5yZWJvb3QgYm1jd2ViLgoKVGhpcyBzZXJpZXJzIG9mIGFjdGlvbnMgY29zdCBtZSB0b28g
bXVjaCB0aW1lLkkgZG9uJ3QgdGhpbmsgaXQgaXMgYSByaWdodCBkZXZlbG9wIGZsb3cgYXMgYSB3
ZWIgZW5naW5lZXIuQ291bGQgdSBzaG93IG1lIHJpZ2h0IHdheSBmb3IgZGVidWdpbmc/CgoKCgpU
aGUgc2Vjb25kIHF1ZXN0aW9uIGlzIHRoYXQgSSBkaWRuJ3QgZmluZCBhbnkgYWN0aW9uIHJlbGF0
ZSB3aXRoICJtZXNvbiBzZXR1cCBidWlsZGRlciAmJiBuaW5qYSAiIGluIGJtY3dlYi5iYi5Ib3cg
ZG9lcyBpdCB3b3JrP2hvdyBjYW4gSSB1c2Ug4oCcSW5jcmVtZW50YWwgSW1wbGVtZW50YXRpb27i
gJ0gdG8gZGVjcmVhc2Ugd2FzdGUgdGltZSBpbiBhY3Rpb24gImJpdGJha2UgYm1jd2ViIiB3aGlj
aCBjb3N0IG1lIHRvbyBtdWNoIHRpbWUuCgoKCgpUaGUgdGhpcmQgcXVlc3Rpb24uRG9zZSBibWN3
ZWIgaGF2ZSBIb3QgRGVwbG95bWVudCBtZXRob2Q/TXVzdCBJIHJlcGxhY2UgYmluYXJ5IGJtY3dl
YiBpbiBvYm1jLXBob3NwaG9yLWltYWdlIGZvciBkZXRlY3R0aW5nIHdyaXRpbmcgcmVzdWx0PwoK
RG9zZSBpdCBleGlzdCBhIGZ1bmN0aW9uIHRvIGRldGVjdCByZXN1bHQgbW9yZSBjb252aW5lbnRs
eSBsaWtlIG5wbSBydW4gc2VydmUgaW4gd2VidWktdnVlLHRoYXQgaXMgbW9yZSBjb252ZW5pZW50
IGFuZCBtb3JlIHNhZmUuSXQgdXNlZCBwcm94eSBhbmQgd2lsbCBuZXZlciByZXBsYWNlIGJpbmFy
eSBmaWxlIGluIG9ibWMuCgoKCgpUaGFua3MhCgoKCgoKCuS/oeaBr+WuieWFqOWjsOaYju+8muac
rOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7h+aJgOaciSzlj5Hku7bk
urrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPliKnjgILor7fmjqXmlLbo
gIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+vLOS4jeW+l+WQkeS7u+S9
leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJgOWQq+S/oeaBr+OAggpJ
bmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4g
dGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5pemF0aW9u
LlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNpcGllbnRzIG5hbWVk
IGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQgYXJlIG5vdCBwZXJt
aXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVuaWNhdGlvbiB0byBv
dGhlcnMu
------=_Part_103972_1665195754.1731477828051
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHN0eWxlIGNsYXNzPSJrZS1zdHlsZSI+CltsaXN0LXN0eWxlLXR5cGVdIHtwYWRkaW5nLWxlZnQ6
MjBweDtsaXN0LXN0eWxlLXBvc2l0aW9uOmluc2lkZX0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkge21h
cmdpbjowfQpbbGlzdC1zdHlsZS10eXBlXSBsaTpiZWZvcmUsIHNwYW4ua2UtbGlzdC1pdGVtLW1h
dHRlciB7Zm9udC1mYW1pbHk6InNhbnMgc2VyaWYiLHRhaG9tYSx2ZXJkYW5hLGhlbHZldGljYX0K
W2xpc3Qtc3R5bGUtdHlwZV0gbGkgcCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoMSxbbGlzdC1zdHls
ZS10eXBlXSBsaSBoMixbbGlzdC1zdHlsZS10eXBlXSBsaSBoMyxbbGlzdC1zdHlsZS10eXBlXSBs
aSBoNCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoNSxbbGlzdC1zdHlsZS10eXBlXSBsaSBkaXYsW2xp
c3Qtc3R5bGUtdHlwZV0gbGkgYmxvY2txdW90ZXtkaXNwbGF5OmlubGluZTt3b3JkLWJyZWFrOmJy
ZWFrLWFsbH0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkgdGFibGUge2Rpc3BsYXk6aW5saW5lLWJsb2Nr
O3ZlcnRpY2FsLWFsaWduOnRvcH0KcHttYXJnaW46MH0KdGQge3dvcmQtYnJlYWs6IGJyZWFrLXdv
cmR9Ci5kZWZhdWx0LWZvbnQtMTczMTQ3NzgwMzEwMnsKZm9udC1zaXplOjE0cHg7Cn0KPC9zdHls
ZT48ZGl2IGNsYXNzPSJkZWZhdWx0LWZvbnQtMTczMTQ3NzgwMzEwMiIgZGlyPSJsdHIiPjxwPldh
aXR0aW5nIGZvciB5b3VyIHJlcGx5LHRoYW5rcyE8L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPjxi
bG9ja3F1b3RlIG5hbWU9InJlcGx5Q29udGVudCIgY2xhc3M9IlJlZmVyZW5jZVF1b3RlIiBzdHls
ZT0icGFkZGluZy1sZWZ0OjVweDttYXJnaW4tbGVmdDo1cHg7Ym9yZGVyLWxlZnQ6I2I2YjZiNiAy
cHggc29saWQ7bWFyZ2luLXJpZ2h0OjA7Ij4tLS0tLeWOn+Wni+mCruS7ti0tLS0tPGJyPgo8Yj7l
j5Hku7bkuro6PC9iPiA8c3BhbiBpZD0icmNfZnJvbSI+5Za75p+P54KcICZsdDt5dWJvd2VpMDk4
MkBwaHl0aXVtLmNvbS5jbiZndDs8L3NwYW4+PGJyPgo8Yj7lj5HpgIHml7bpl7Q6PC9iPiA8c3Bh
biBpZD0icmNfc2VudHRpbWUiPjIwMjQtMTEtMTIgMTE6NTQ6MTggKOaYn+acn+S6jCk8L3NwYW4+
PGJyPgo8Yj7mlLbku7bkuro6PC9iPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8YnI+CjxiPuS4
u+mimDo8L2I+IEJNQ1dFQiBkZWJ1ZyBxdWVzdGlvbjxicj48YnI+PHN0eWxlIGNsYXNzPSJrZS1z
dHlsZSI+CltsaXN0LXN0eWxlLXR5cGVdIHtwYWRkaW5nLWxlZnQ6MjBweDtsaXN0LXN0eWxlLXBv
c2l0aW9uOmluc2lkZX0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkge21hcmdpbjowfQpbbGlzdC1zdHls
ZS10eXBlXSBsaTpiZWZvcmUsIHNwYW4ua2UtbGlzdC1pdGVtLW1hdHRlciB7Zm9udC1mYW1pbHk6
InNhbnMgc2VyaWYiLHRhaG9tYSx2ZXJkYW5hLGhlbHZldGljYX0KW2xpc3Qtc3R5bGUtdHlwZV0g
bGkgcCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoMSxbbGlzdC1zdHlsZS10eXBlXSBsaSBoMixbbGlz
dC1zdHlsZS10eXBlXSBsaSBoMyxbbGlzdC1zdHlsZS10eXBlXSBsaSBoNCxbbGlzdC1zdHlsZS10
eXBlXSBsaSBoNSxbbGlzdC1zdHlsZS10eXBlXSBsaSBkaXYsW2xpc3Qtc3R5bGUtdHlwZV0gbGkg
YmxvY2txdW90ZXtkaXNwbGF5OmlubGluZTt3b3JkLWJyZWFrOmJyZWFrLWFsbH0KW2xpc3Qtc3R5
bGUtdHlwZV0gbGkgdGFibGUge2Rpc3BsYXk6aW5saW5lLWJsb2NrO3ZlcnRpY2FsLWFsaWduOnRv
cH0KcHttYXJnaW46MH0KdGQge3dvcmQtYnJlYWs6IGJyZWFrLXdvcmR9Ci5kZWZhdWx0LWZvbnQt
MTczMTM4MzQxNzc3N3sKZm9udC1zaXplOjE0cHg7Cn0KPC9zdHlsZT48ZGl2IGNsYXNzPSJkZWZh
dWx0LWZvbnQtMTczMTM4MzQxNzc3NyIgZGlyPSJsdHIiPjxwIGRpcj0iYXV0byIgc3R5bGU9ImJv
eC1zaXppbmc6Ym9yZGVyLWJveDttYXJnaW4tYm90dG9tOnZhcigtLWJhc2Utc2l6ZS0xNik7Y29s
b3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQs
ICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwg
QXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtT
ZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNGRkZG
RkY7Ij5IZWxsbyxwbTwvcD48cCBkaXI9ImF1dG8iIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1i
b3g7bWFyZ2luLWJvdHRvbTp2YXIoLS1iYXNlLXNpemUtMTYpO2NvbG9yOiMxRjIzMjg7Zm9udC1m
YW1pbHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZx
dW90OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlm
LCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVv
dDs7dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+PGJyPjwvcD48cCBk
aXI9ImF1dG8iIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7bWFyZ2luLWJvdHRvbTp2YXIo
LS1iYXNlLXNpemUtMTYpO2NvbG9yOiMxRjIzMjg7Zm9udC1mYW1pbHk6LWFwcGxlLXN5c3RlbSwg
QmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgJnF1b3Q7Tm90byBTYW5z
JnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBF
bW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7dGV4dC13cmFwOndyYXA7YmFj
a2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+RWFjaCB0aW1lIGRlYnVnaW5nIGEgZnVuY2lvbiBvZiBv
bmUgbGluZSBjb2RlIHdpbGwgY29zdCBtZSB0b28gbXVjaCB0aW1lLjxiciBzdHlsZT0iYm94LXNp
emluZzpib3JkZXItYm94OyI+MS50eXBlICJiaXRiYWtlIGJtY3dlYiIsdGhpcyBhY3Rpb24gd2ls
bCBjb3N0IG1lIDUgbWludXRlcy48YnIgc3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDsiPjIu
UmVwbGFjZSBibWN3ZWIgYmluYXJ5IGZpbGUuPGJyIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1i
b3g7Ij4zLnJlYm9vdCBibWN3ZWIuPC9wPjxwIGRpcj0iYXV0byIgc3R5bGU9ImJveC1zaXppbmc6
Ym9yZGVyLWJveDttYXJnaW4tYm90dG9tOnZhcigtLWJhc2Utc2l6ZS0xNik7Y29sb3I6IzFGMjMy
ODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1Nl
Z29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNh
bnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBF
bW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNGRkZGRkY7Ij5UaGlz
IHNlcmllcnMgb2YgYWN0aW9ucyBjb3N0IG1lIHRvbyBtdWNoIHRpbWUuSSBkb24ndCB0aGluayBp
dCBpcyBhIHJpZ2h0IGRldmVsb3AgZmxvdyBhcyBhIHdlYiBlbmdpbmVlci5Db3VsZCB1IHNob3cg
bWUgcmlnaHQgd2F5IGZvciBkZWJ1Z2luZz88L3A+PHAgZGlyPSJhdXRvIiBzdHlsZT0iYm94LXNp
emluZzpib3JkZXItYm94O21hcmdpbi1ib3R0b206dmFyKC0tYmFzZS1zaXplLTE2KTtjb2xvcjoj
MUYyMzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1
b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlh
bCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29l
IFVJIEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6I0ZGRkZGRjsi
Pjxicj48L3A+PHAgZGlyPSJhdXRvIiBzdHlsZT0iYm94LXNpemluZzpib3JkZXItYm94O21hcmdp
bi1ib3R0b206dmFyKC0tYmFzZS1zaXplLTE2KTtjb2xvcjojMUYyMzI4O2ZvbnQtZmFtaWx5Oi1h
cHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZx
dW90O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7
QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7O3RleHQt
d3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6I0ZGRkZGRjsiPlRoZSBzZWNvbmQgcXVlc3Rpb24g
aXMgdGhhdCBJIGRpZG4ndCBmaW5kIGFueSBhY3Rpb24gcmVsYXRlIHdpdGggIm1lc29uIHNldHVw
IGJ1aWxkZGVyICZhbXA7JmFtcDsgbmluamEgIiBpbiBibWN3ZWIuYmIuSG93IGRvZXMgaXQgd29y
az9ob3cgY2FuIEkgdXNlIOKAnEluY3JlbWVudGFsIEltcGxlbWVudGF0aW9u4oCdIHRvIGRlY3Jl
YXNlIHdhc3RlIHRpbWUgaW4gYWN0aW9uICJiaXRiYWtlIGJtY3dlYiIgd2hpY2ggY29zdCBtZSB0
b28gbXVjaCB0aW1lLjwvcD48cCBkaXI9ImF1dG8iIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1i
b3g7bWFyZ2luLWJvdHRvbTp2YXIoLS1iYXNlLXNpemUtMTYpO2NvbG9yOiMxRjIzMjg7Zm9udC1m
YW1pbHk6LWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZx
dW90OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlm
LCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVv
dDs7dGV4dC13cmFwOndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+PGJyPjwvcD48cCBk
aXI9ImF1dG8iIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7bWFyZ2luLWJvdHRvbTp2YXIo
LS1iYXNlLXNpemUtMTYpO2NvbG9yOiMxRjIzMjg7Zm9udC1mYW1pbHk6LWFwcGxlLXN5c3RlbSwg
QmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgJnF1b3Q7Tm90byBTYW5z
JnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBF
bW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7dGV4dC13cmFwOndyYXA7YmFj
a2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+VGhlIHRoaXJkIHF1ZXN0aW9uLkQ8c3BhbiBzdHlsZT0i
Y29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZv
bnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGlj
YSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVv
dDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNG
RkZGRkY7Ij5vc2UgYm1jd2ViIGhhdmUgSG90IERlcGxveW1lbnQgbWV0aG9kPzxzcGFuIHN0eWxl
PSJjb2xvcjojMUYyMzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVt
Rm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZxdW90OywgSGVsdmV0
aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZx
dW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6
I0ZGRkZGRjsiPk11c3QgSSByZXBsYWNlIGJpbmFyeSBibWN3ZWIgaW4gb2JtYy1waG9zcGhvci1p
bWFnZSBmb3IgZGV0ZWN0dGluZyB3cml0aW5nIHJlc3VsdD88L3NwYW4+PC9zcGFuPjwvcD48cD48
c3BhbiBzdHlsZT0iY29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlu
a01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVv
dDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2pp
JnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3Jv
dW5kLWNvbG9yOiNGRkZGRkY7Ij5Eb3NlIGl0IGV4aXN0IGEgZnVuY3Rpb24gdG8gZGV0ZWN0IHJl
c3VsdCBtb3JlIGNvbnZpbmVudGx5IGxpa2UgbnBtIHJ1biBzZXJ2ZSBpbiB3ZWJ1aS12dWUsdGhh
dCBpcyBtb3JlIGNvbnZlbmllbnQgYW5kIG1vcmUgc2FmZS5JdCB1c2VkIHByb3h5IGFuZCB3aWxs
IG5ldmVyIHJlcGxhY2UgYmluYXJ5IGZpbGUgaW4gb2JtYy48L3NwYW4+PC9wPjxwPjxiciBzdHls
ZT0iYm94LXNpemluZzpib3JkZXItYm94O2NvbG9yOiMxRjIzMjg7Zm9udC1mYW1pbHk6LWFwcGxl
LXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgJnF1b3Q7
Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBs
ZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7dGV4dC13cmFw
OndyYXA7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+PC9wPjxwPjxzcGFuIHN0eWxlPSJjb2xv
cjojMUYyMzI4O2ZvbnQtZmFtaWx5Oi1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwg
JnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBB
cmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1Nl
Z29lIFVJIEVtb2ppJnF1b3Q7O3RleHQtd3JhcDp3cmFwO2JhY2tncm91bmQtY29sb3I6I0ZGRkZG
RjsiPlRoYW5rcyE8L3NwYW4+PC9wPjxwIGRpcj0iYXV0byIgc3R5bGU9ImJveC1zaXppbmc6Ym9y
ZGVyLWJveDttYXJnaW4tYm90dG9tOnZhcigtLWJhc2Utc2l6ZS0xNik7Y29sb3I6IzFGMjMyODtm
b250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29l
IFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMt
c2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9q
aSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNvbG9yOiNGRkZGRkY7Ij48c3BhbiBz
dHlsZT0iY29sb3I6IzFGMjMyODtmb250LWZhbWlseTotYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5
c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhl
bHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7
LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Ozt0ZXh0LXdyYXA6d3JhcDtiYWNrZ3JvdW5kLWNv
bG9yOiNGRkZGRkY7Ij48L3NwYW4+PGJyPjwvcD48L2Rpdj48YnI+PGJyPjxpIHN0eWxlPSJjb2xv
cjojNzc3Nzc3O2ZvbnQtZmFtaWx5OuWui+S9kztmb250LXNpemU6eC1zbWFsbDsiPuS/oeaBr+Wu
ieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7
h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPl
iKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+v
LOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJ
gOWQq+S/oeaBr+OAgjxicj5JbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2Vu
ZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlh
bC5SZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVj
eSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMg
Y29tbXVuaWNhdGlvbiB0byBvdGhlcnMuPC9pPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PGJyPjxp
IHN0eWxlPSJjb2xvcjogcmdiKDExOSwgMTE5LCAxMTkpOyBmb250LWZhbWlseTog5a6L5L2TOyBm
b250LXNpemU6IHgtc21hbGw7Ij7kv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7ku7bljIXlkKvk
v6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo57uE57uH
5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo5oSP5L+d5a+G
LOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzkuInmlrnnu4Tn
u4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgII8YnI+SW5mb3JtYXRpb24g
U2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBp
cyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwg
Y29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUg
b2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRp
c2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLjwvaT4=

------=_Part_103972_1665195754.1731477828051--

