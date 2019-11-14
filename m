Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5981FC5C5
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 12:58:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DKkK0RtVzF6KV
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 22:58:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=113.96.223.67; helo=qq.com; envelope-from=1026646700@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="GPAHB1dO"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg407.qq.com [113.96.223.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DKjF280WzF4cD
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 22:57:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1573732604; bh=kM5GQxZk1nmrPttV7ndBONVxPMRJxNDb5E3D2D/2nmY=;
 h=Subject:From:To:Date:MIME-Version:Message-ID;
 b=GPAHB1dOcNWYJ73sHKaSBHIIRQYWXSAk9zH/0NXJum0x3bvIX1gUB4Y9bgkZY5D2+
 RopHEr+kwiT3TeMXwbWH1XLKfgCmodepw9XNC0/RrgRlvJfx77f92ICm1pllbWJgRu
 CSS3qQVBv8L/FmUYTAs+in6+Zo3n07gXTMlPl4Ig=
X-QQ-mid: esmtp5t1573732603tk5i94lmi
Received: from localhost (unknown [106.121.135.183])
 by esmtp4.qq.com (ESMTP) with SMTP id 0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 19:56:42 +0800 (CST)
X-QQ-SSF: 0000000000000081QG120F00000000Z
X-QQ-FEAT: oxgq2YVMtX+n8lG1wLXfQezTHYV4dyZm/9CdRpmu9UPjF5g0M9S/TeqIV3DTh
 6d6HLunr7yvJYhpg6qjrKhEB/HN21cDm2asp6m+PvDuBUy1RRTzjC013FTR6iPtS5+J2gBL
 8o6OcdJ69e2yPj05hWbOnffZ5x7qq4nVb3wM49mEqC/ufUvmeTYunZeExXIEWOYvlB5s7WB
 8YhB+h9VoSp/NqG1uYTgMHL7M6uN/mPjRLFILLJhxKB/RK/EJepCb2Lyppx9XzY1IkqcuLd
 SNELLvREBV263a6TTvW0FwXyhmA6MWYwNa6MLZxQ+xC4dWsneTo4eoTuWnSp/TvGdGAg==
X-QQ-GoodBg: 0
Subject: romulus+x86 platform +ast2500 How to control Host power on/off
From: "" <1026646700@qq.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 14 Nov 2019 19:56:41 +0800
MIME-Version: 1.0
X-Priority: 3
Message-ID: <1573732600310.5milttnbuista0aafbkhfxsy@android.mail.163.com>+CE5053311AD99402
X-CUSTOM-MAIL-MASTER-SENT-ID: MailMasterAndroid-10626-1573732600394-85e067ed-28b5-4caa-bc37-46718a468ddf
Content-Type: multipart/alternative;
 boundary="__MESSAGE_BODY_PART__1_3394771859687416040"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
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

--__MESSAGE_BODY_PART__1_3394771859687416040
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

UGxlYXNlIGhlbHAgbWUgMTAyNjY0NjcwMCDpgq7nrrHvvJoxMDI2NjQ2NzAwQHFxLmNvbSDnrb7l
kI3nlLEg572R5piT6YKu566x5aSn5biIIOWumuWItg==

--__MESSAGE_BODY_PART__1_3394771859687416040
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8ZGl2IHN0eWxlPSJs
aW5lLWhlaWdodDoxLjY7Zm9udC1mYW1pbHk6J+iLueaWuScsJ+W+rui9r+mbhem7kScsJ3NhbnMt
c2VyaWYnOyI+UGxlYXNlIGhlbHAgbWU8YnIvPjxici8+PC9kaXY+PGRpdiBjbGFzcz0nbmUtcXVv
dGVkJz4gICAgICAgIDxhIGhyZWY9Imh0dHBzOi8vbWFhcy5tYWlsLjE2My5jb20vZGFzaGktd2Vi
LWV4dGVuZC9odG1sL3Byb1NpZ25hdHVyZS5odG1sP2Z0bElkPTEmbmFtZT0xMDI2NjQ2NzAwJnVp
ZD0xMDI2NjQ2NzAwJTQwcXEuY29tJmljb25Vcmw9aHR0cHMlM0ElMkYlMkZtYWlsLW9ubGluZS5u
b3Nkbi4xMjcubmV0JTJGcWl5ZWxvZ28lMkZkZWZhdWx0QXZhdGFyLnBuZyZpdGVtcz0lNUIlMjIl
RTklODIlQUUlRTclQUUlQjElRUYlQkMlOUExMDI2NjQ2NzAwJTQwcXEuY29tJTIyJTVEIiBzdHls
ZT0iZGlzcGxheTpibG9jaztiYWNrZ3JvdW5kOiNmZmY7IG1heC13aWR0aDogNDAwcHg7IF93aWR0
aDogNDAwcHg7cGFkZGluZzoxNXB4IDAgMTBweCAwO3RleHQtZGVjb3JhdGlvbjogbm9uZTsgb3V0
bGluZTpub25lOy13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjp0cmFuc3BhcmVudDstd2Via2l0
LXRleHQtc2l6ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50O3RleHQtc2l6ZS1hZGp1c3Q6bm9uZSAh
aW1wb3J0YW50OyI+CiAgICAgICAgICAgIDx0YWJsZSBjZWxscGFkZGluZz0iMCIgc3R5bGU9J3dp
ZHRoOiAxMDAlOyBtYXgtd2lkdGg6IDEwMCU7IHRhYmxlLWxheW91dDogZml4ZWQ7IGJvcmRlci1j
b2xsYXBzZTogY29sbGFwc2U7Y29sb3I6ICM5YjllYTE7Zm9udC1zaXplOiAxNHB4O2xpbmUtaGVp
Z2h0OjEuMzstd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50O3RleHQtc2l6
ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50Oyc+CiAgICAgICAgICAgICAgICA8dGJvZHkgc3R5bGU9
ImZvbnQtZmFtaWx5OiAnUGluZ0ZhbmcgU0MnLCAnSGlyYWdpbm8gU2FucyBHQicsJ1dlblF1YW5Z
aSBNaWNybyBIZWknLCAnTWljcm9zb2Z0IFlhaGVpJywgJ+W+rui9r+mbhem7kScsIHZlcmRhbmEg
IWltcG9ydGFudDsgd29yZC13cmFwOmJyZWFrLXdvcmQ7IHdvcmQtYnJlYWs6YnJlYWstYWxsOy13
ZWJraXQtdGV4dC1zaXplLWFkanVzdDpub25lICFpbXBvcnRhbnQ7dGV4dC1zaXplLWFkanVzdDpu
b25lICFpbXBvcnRhbnQ7Ij4KICAgICAgICAgICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8dGQgd2lkdGg9IjM4IiBzdHlsZT0icGFkZGluZzowOyBib3gtc2l6aW5n
OiBib3JkZXItYm94OyB3aWR0aDogMzhweDsiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDxpbWcgd2lkdGg9IjM4IiBoZWlnaHQ9IjM4IiBzdHlsZT0idmVydGljYWwtYWxpZ246bWlk
ZGxlOyB3aWR0aDogMzhweDsgaGVpZ2h0OiAzOHB4OyBib3JkZXItcmFkaXVzOjUwJTsiIHNyYz0i
aHR0cHM6Ly9tYWlsLW9ubGluZS5ub3Nkbi4xMjcubmV0L3FpeWVsb2dvL2RlZmF1bHRBdmF0YXIu
cG5nIiAvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDx0ZCBzdHlsZT0ncGFkZGluZzogMCAwIDAgMTBweDsgY29sb3I6ICMzMTM1
M2I7Jz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IHN0eWxlPSJmb250LXNp
emU6IDE2cHg7Zm9udC13ZWlnaHQ6Ym9sZDsgd2lkdGg6MTAwJTsgd2hpdGUtc3BhY2U6IG5vd3Jh
cDsgb3ZlcmZsb3c6aGlkZGVuO3RleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyI+MTAyNjY0NjcwMDwv
ZGl2PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAg
ICA8L3RyPgogICAgICAgICAgICAgICAgICAgICAgICA8dHIgd2lkdGg9IjEwMCUiIHN0eWxlPSJm
b250LXNpemU6IDE0cHggIWltcG9ydGFudDsgd2lkdGg6IDEwMCU7Ij4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDx0ZCBjb2xzcGFuPScyJyBzdHlsZT0icGFkZGluZzoxMHB4IDAgMCAwOyBm
b250LXNpemU6MTRweCAhaW1wb3J0YW50OyB3aWR0aDogMTAwJTsiPgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8ZGl2IHN0eWxlPSJ3aWR0aDogMTAwJTtmb250LXNpemU6IDE0
cHggIWltcG9ydGFudDt3b3JkLXdyYXA6YnJlYWstd29yZDt3b3JkLWJyZWFrOmJyZWFrLWFsbDsi
PumCrueuse+8mjEwMjY2NDY3MDBAcXEuY29tPC9kaXY+CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAg
PC90Ym9keT4KICAgICAgICAgICAgPC90YWJsZT4KICAgICAgICA8L2E+PGh0bWw+PGJvZHk+PHAg
c3R5bGU9ImJvcmRlci10b3A6MXB4IHNvbGlkICNlNWU1ZTU7cGFkZGluZy10b3A6IDhweDsgZm9u
dC1zaXplOiAxMnB4OyBjb2xvcjojYjZiOGJiO2xpbmUtaGVpZ2h0OiAxLjgzMzsiPuetvuWQjeeU
sSA8YSBocmVmPSJodHRwczovL21haWwuMTYzLmNvbS9kYXNoaS9kbHByby5odG1sP2Zyb209bWFp
bDg4IiBzdHlsZT0iY29sb3I6IzZhYThmNjt0ZXh0LWRlY29yYXRpb246IG5vbmUiPue9keaYk+mC
rueuseWkp+W4iDwvYT4g5a6a5Yi2PC9wPjwvYm9keT48L2h0bWw+PC9kaXY+CjwvYm9keT4KPC9o
dG1sPg==

--__MESSAGE_BODY_PART__1_3394771859687416040--



