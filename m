Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B5359602
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGq056dQmz3bnx
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=gHbTfowA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=xuxiaohan@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gHbTfowA; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGpzs3m3Hz2xZF
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 17:05:12 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id n8so8118363lfh.1
 for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=references:in-reply-to:from:mime-version:date:message-id:subject:to
 :cc; bh=Dx5lXHzo1bobPGxSsjn/UxKEasbGFMHYrrvhQ65oIak=;
 b=gHbTfowAoG5uK1Aep7xWRdsn8eRHCCQSgY9arRNkcJDbZjA0q2qEiq2gfrQPWjqebG
 9M26BuqIT5xxBnavpo9ol2daWvjzRqcoMi0zXi44bTJxbE1pskTQZdVR9i0hbAimpz1q
 Eaj3VxMTruefvmNdYJupysFZ3xLrk6hr9TMHrHmy2USJTZ+LwDW36tdemZpy/mOOhFrJ
 SMwhCh0DXOH8oUe1hHthSYWSkD8VIlb3eHNsGdpYN9/L7pYSsGx0qJ7nIQx69ZVcv8Ea
 bgadsWF4UscJwYVQzn9FzC0OmZ0RF/liMrTGlTWbelN8JLIzfzRtdM8SXPZRvizuwZXm
 6N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:in-reply-to:from:mime-version:date
 :message-id:subject:to:cc;
 bh=Dx5lXHzo1bobPGxSsjn/UxKEasbGFMHYrrvhQ65oIak=;
 b=ItbpZ9nwFTbrKoqK19y+beCnAvycjTt4uA1sbOG7v7lgY21p7LnddBQErnsEm2+VK/
 lOx5Ei7ZxUZk0SsAzk5nSvL/St74JIiVvRHlHkgo8p3xFqK5vTjUkp3cS+wlj9iKuKjf
 l6aBemw6BqR7Xp8dspiRueK0VpuVxUHRI6LyTqLE3M80O157vBkuuZlww2voLVM86wV9
 ebe1PwRKs0HXu+2vfvj40i4MDUL5FY7jmjVkHNpN7hiWkrv0OWTVIhBCS/31rZteeZAd
 BA2wbNxCakruxj3RSYgHW5pb3aUkwNkSgbYVgR7dL3V7idNvhwGuiZzlZ+F45cmh6fVs
 gmkg==
X-Gm-Message-State: AOAM530/2/+0kp1dZmTWMj6RAvm2E4gvHwQHqXNC2y/ZtLKYhbB1j/Tn
 OkhRDIu/omIOi9911QVJl/NTqn5Hbffzfz664//x0g==
X-Google-Smtp-Source: ABdhPJwudDLqOJitsk3YRmHBLqkT8Z37AvqN5TROwG07omNi3r56aRTR/XVZVA8+t+3VUBzDecMrjFWM9eL/jdLTgBo=
X-Received: by 2002:a05:6512:11c2:: with SMTP id
 h2mr9485222lfr.94.1617951906472; 
 Fri, 09 Apr 2021 00:05:06 -0700 (PDT)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Apr 2021 00:05:05 -0700
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
 <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
 <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
 <2FVxBtO4gLzVYqZqGL8XwOcI2a_r6x0CaPGmGozxe_VeNp3Y3y05vSntyZPvfn4EDRsHsLjWJnrVSzbeeVDKhPvLILmFKB3hw-MFaEvepAw=@protonmail.com>
 <CAGm54UFX9LPHArj-2q=w2pNtwgpkjZJE_0Dgd3_8cXB9z3L2vQ@mail.gmail.com>
 <iLDkk0KnZ0UufxY54elPTZxzhBfLP6TM3JvJ-yIqJoON60n3r8wNXPPbZIEOolJybm41D2yeFVRhSCk_WJNiwZ6kfcu5TmSSPuUEBJOy8mU=@protonmail.com>
In-Reply-To: <iLDkk0KnZ0UufxY54elPTZxzhBfLP6TM3JvJ-yIqJoON60n3r8wNXPPbZIEOolJybm41D2yeFVRhSCk_WJNiwZ6kfcu5TmSSPuUEBJOy8mU=@protonmail.com>
From: =?UTF-8?B?6K645pmT6I+h?= <xuxiaohan@bytedance.com>
Mime-Version: 1.0
Date: Fri, 9 Apr 2021 00:05:05 -0700
Message-ID: <CAJurvrvhBaDb-5vmt83=qVJabL8gOTGhNAj5qcsQzKY1-h7qew@mail.gmail.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW0V4dGVybmFsXSBSZTogSVBNSSBTRUwgUGFyc2luZw==?=
To: rgrs <rgrs@protonmail.com>
Content-Type: multipart/alternative; boundary="000000000000a640c505bf84c8b7"
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Lei Yu <yulei.sh@bytedance.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a640c505bf84c8b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

WW91IGNhbiBzZXQgRVhUUkFfT0VDT05GICs9ICJFUlJPUl9JTkZPX0NBUD0xMDAwIiBpbg0KcGhw
c3Bob3ItbG9nZ2luZ18lLGJiYXBwZW5kIGZpbGUgdG8gbW9kaWZ5IHRoZSBtYXggc2VsIG51bSBm
b3IgaXBtaXRvb2wgc2VsDQpsaXN0DQoNCuS6jjIwMjHlubQ05pyIOOaXpSAo5ZGo5ZubKSAyMDoz
OSA8cmdyc0Bwcm90b25tYWlsLmNvbT4g5YaZ6YGTOg0KDQpIaSBMZWksIEkgYW0gc3RpbGwgZ2V0
dGluZyAidW5kZXJ0ZXJtaW5lZCBzeXN0ZW0gaGFyZHdhcmUgZmFpbHVyZSIgaW4NCmlwbWl0b29s
IHNlbCBsaXN0LiBEbyB5b3UgaGF2ZSBhbnkgcGxhdGZvcm1zIHRvIHJlZmVyIHRvIChpbiB1cHN0
cmVhbSk/DQppcG1pdG9vbCBzZWwgYWxzbyBsaXN0IG9ubHkgMTAgbG9nZ2luZyBlbnRyaWVzIGFu
ZCByb3RhdGVzIGFmdGVyIHRoYXQuIElzDQppdCBleHBlY3RlZD8gLVJhaiDigJDigJDigJDigJDi
gJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDigJDigJDigJDigJDigJAgT24gRnJpZGF5
LCAyIEFwcmlsIDIwMjENCjA3OjI2LCBMZWkgWXUgd3JvdGU6ID4gT24gVGh1LCBBcHIgMSwgMjAy
MSBhdCA4OjU2IFBNIHJncnMNCnJncnNAcHJvdG9ubWFpbC5jb20gd3JvdGU6ID4gPiA+IEhpIExl
aSwgPiA+IElzIEZSVSBFRVBST00gcmVxdWlyZWQgZm9yDQppbnZlbnRvcnkgdG8gd29yaz8gTXkg
Ym9hcmQgaGFzIHVucHJvZ3JhbW1lZCBFRVBST00uID4gPiBJIGNvbnN0cnVjdGVkIHRoZQ0KYnVz
Y3RsIGNvbW1hbmQgYWNjb3JkaW5nIGFzIGJlbG93LCBJIHN0aWxsIGdldCDigJxVbmRldGVybWlu
ZWQgSGFyZHdhcmUNCkZhaWx1cmXigJ0uIFBsZWFzZSBjYW4geW91IGxldCBtZSBrbm93IGlmIG15
IGNvbmZpZyBZQU1MIGhhcyBhbnkgaXNzdWVzPyA+ID4NCj4gPiBidXNjdGwgY2FsbCAieHl6Lm9w
ZW5ibWNfcHJvamVjdC5Mb2dnaW5nLklQTUkiDQoiL3h5ei9vcGVuYm1jX3Byb2plY3QvTG9nZ2lu
Zy9JUE1JIiB4eXoub3BlbmJtY19wcm9qZWN0LkxvZ2dpbmcuSVBNSQ0KSXBtaVNlbEFkZCBzc2F5
YnEgIlNlbnNvciBtZXNzYWdlIg0KL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJh
dHVyZS9CTUNfVGVtcCAzIDB4MDEgMHhGRiAweEZGIHRydWUNCjB4MjAgPiA+ID4gPg0KPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4g
WW91IG5lZWQgdG8gcHV0IC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUv
Qk1DX1RlbXAgaW50bw0KPiBzcDMtaXBtaS1pbnZlbnRvcnktc2Vuc29ycy55YW1sIGFzIHdlbGwg
dG8gbWFrZSBpcG1pZCB0byBrbm93IGhvdyB0byA+DQptYXAgdGhlIGRidXMgcGF0aCB0byB0aGUg
c2Vuc29yIGlkIGluIHRoZSBzZWwuDQo=
--000000000000a640c505bf84c8b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div><div style=3D"line-height:1.6;font-size:14px"=
><div class=3D"" dir=3D"auto"><span>You can set EXTRA_OECONF +=3D &quot;ERR=
OR_INFO_CAP=3D1000&quot; in phpsphor-logging_%,bbappend file </span><span c=
lass=3D" fontfamily backgroundcolor fontweight  fontsize fontcolor " style=
=3D"font-family:-apple-system,system-ui,Roboto,Ubuntu,Cantarell,sans-serif;=
background-color:rgb(245,245,245);font-weight:400;font-size:14px;color:rgb(=
0,0,0)">to modify the max sel num for ipmitool sel list</span></div><div cl=
ass=3D"" style=3D"padding-left:12px;border-left:0.5px solid rgb(187,191,196=
)" id=3D"lark-mail-quote-161795190"><div><blockquote class=3D"" id=3D"lark-=
mail-block-content-161795190" style=3D"padding:0px;margin:0px"><div id=3D"l=
ark-mail-quote-87dc365c51f2300662f2bce3da1596d7"><div class=3D"" id=3D"lark=
-mail-block-attr-161795190" style=3D"color:rgb(143,149,158)">=E4=BA=8E2021=
=E5=B9=B44=E6=9C=888=E6=97=A5 (=E5=91=A8=E5=9B=9B) 20:39 &lt;<a href=3D"mai=
lto:rgrs@protonmail.com" style=3D"color:rgb(51,112,255)">rgrs@protonmail.co=
m</a>&gt; =E5=86=99=E9=81=93:</div><blockquote style=3D"padding:0px;margin:=
8px 0px 0px" class=3D"" id=3D"lark-mail-block-content-161795190"><div style=
=3D"white-space:pre-wrap"><span>Hi Lei,

I am still getting &quot;undertermined system hardware failure&quot; in ipm=
itool sel list. Do you have any platforms to refer to (in upstream)?

ipmitool sel also list only 10 logging entries and rotates after that. Is i=
t expected?

-Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, 2 April 2021 07:26, Lei Yu  wrote:

&gt; On Thu, Apr 1, 2021 at 8:56 PM rgrs <a href=3D"mailto:rgrs@protonmail.=
com" target=3D"_blank">rgrs@protonmail.com</a> wrote:
&gt;
&gt; &gt; Hi Lei,
&gt; &gt; Is FRU EEPROM required for inventory to work? My board has unprog=
rammed EEPROM.
&gt; &gt; I constructed the busctl command according as below, I still get =
=E2=80=9CUndetermined Hardware Failure=E2=80=9D. Please can you let me know=
 if my config YAML has any issues?
&gt; &gt;
&gt; &gt; busctl call &quot;xyz.openbmc_project.Logging.IPMI&quot; &quot;/x=
yz/openbmc_project/Logging/IPMI&quot; xyz.openbmc_project.Logging.IPMI Ipmi=
SelAdd ssaybq &quot;Sensor message&quot; /xyz/openbmc_project/sensors/tempe=
rature/BMC_Temp 3 0x01 0xFF 0xFF true 0x20
&gt; &gt;
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
&gt;
&gt; You need to put /xyz/openbmc_project/sensors/temperature/BMC_Temp into
&gt; sp3-ipmi-inventory-sensors.yaml as well to make ipmid to know how to
&gt; map the dbus path to the sensor id in the sel.</span></div></blockquot=
e></div></blockquote></div></div></div></div></body></html>

--000000000000a640c505bf84c8b7--
