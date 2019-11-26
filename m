Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA1D109F45
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 14:29:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ml9Y6TLPzDqfG
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 00:29:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=z1908144712@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qVyi6tO/"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ml1J0YQJzDqcj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 00:21:55 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id b19so9202615pfd.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:message-id:subject:disposition-notification-to
 :mime-version:content-transfer-encoding;
 bh=m09ZiH5hYrmqmveTl3GTxUHG1dIm+430INLN3P/8ozA=;
 b=qVyi6tO/cvvttKSLXakihAIBfg9UJT1O7PsMZcy72CYKbsdpOCFn0OTDTFg0rG3qbT
 s1xCf3m+YHcKZR2nk/j6EXZAjnxRBJKmQXAVtMFUfSnpBVhOzhfaWrJf2dhDIyZkhSi2
 HS0uqixObiNb5uw0pRSqEwLLciGvkz9OAtbS8lmvBTmfc7m7WTxZFal+rygsv+w/nHch
 +FegAPU5QyoQWpOKHvJPV5QhHHh8wCHBh9F8xv2UztkiQX6I9Ad56nwrFxHKJw7mIrul
 kyeFVv2wxIDCpz+Lp6QnjopiGIs0n0KvKMDtIWgMtg4ZfKsurXcM2Ce5qY7J+83x+x0N
 OudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:subject
 :disposition-notification-to:mime-version:content-transfer-encoding;
 bh=m09ZiH5hYrmqmveTl3GTxUHG1dIm+430INLN3P/8ozA=;
 b=GDM6D/Oi+YtJSSly9uHMkTU1rEu/6qIG9LNC6NPCCnNudcVQsgl9ujzJTCrqu2kP26
 sr5Gu93XhV1bzfIPGcwfuSBhsjuaz6vV+d+13yoyrCTQYS+f7lZWO+kb/mZb32y1HRz/
 aL2AIN1ort/HFrCeTyCCQN7QOrXXuBecvSPRgIk8j4KGxSgP0kcAIeipnOozbtzTAK6M
 WqV4p1vefADFaBULd5ju84+KTHw7rJWcGM1vU/EHet2H7FcyHD7Un4E6nLcnEFzw/axP
 csyOJopT/OKc9YZtwuaD/OBRp/oEMh87kj3igQCk22Ug5AKf9X50PSd2amE9SBkxdT6I
 VGGw==
X-Gm-Message-State: APjAAAXan6hklLDWXbytsY2AaRtXvRMgvWDz1ekjqQd1GxZApCmyqSJK
 LPjvLBtw+tEE8+kf6z+Q4UgwaD0X
X-Google-Smtp-Source: APXvYqyCsHWFPnUgZSA1NNX8xZ/ovRv6GXc3UCPFNwAejr00RJdOyuSlGOCkTnFZUgouTmM6gqZ4DQ==
X-Received: by 2002:a63:646:: with SMTP id 67mr39201445pgg.311.1574774510053; 
 Tue, 26 Nov 2019 05:21:50 -0800 (PST)
Received: from DESKTOP-Q4CNDFP ([103.129.252.46])
 by smtp.gmail.com with ESMTPSA id u3sm12525029pgp.51.2019.11.26.05.21.48
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 05:21:49 -0800 (PST)
Date: Tue, 26 Nov 2019 21:21:46 +0800
From: z1908144712 <z1908144712@gmail.com>
To: =?utf-8?Q?openbmc=40lists.ozlabs.org?= <openbmc@lists.ozlabs.org>
Message-ID: <AF1B49BD-7815-4735-9D2D-A60AD7147851@gmail.com>
Subject: Can ipkvm run well on the ast2400?
X-Mailer: MailMasterPC/4.13.1.1012 (Windows 10 RS5)
X-CUSTOM-MAIL-MASTER-SENT-ID: 95DEC171-611F-4A68-8DEA-C4112938E766
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64
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

PGh0bWw+DQo8aGVhZD4NCiAgICA8bWV0YSBodHRwLWVxdWl2PSdDb250ZW50LVR5cGUnIGNvbnRl
bnQ9J3RleHQvaHRtbDsgY2hhcnNldD1VVEYtOCc+DQo8L2hlYWQ+DQo8Ym9keT4NCjxzdHlsZT4N
CiAgICBmb250ew0KICAgICAgICBsaW5lLWhlaWdodDogMS42Ow0KICAgIH0NCiAgICB1bCxvbHsN
CiAgICAgICAgcGFkZGluZy1sZWZ0OiAyMHB4Ow0KICAgICAgICBsaXN0LXN0eWxlLXBvc2l0aW9u
OiBpbnNpZGU7DQogICAgfQ0KPC9zdHlsZT4NCjxkaXYgc3R5bGUgPSAnZm9udC1mYW1pbHk65b6u
6L2v6ZuF6buRLFZlcmRhbmEsJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LFNpbVN1bixzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyBsaW5lLWhlaWdodDoxLjY7Jz4NCiAgICA8ZGl2ID48L2Rp
dj48ZGl2PgogICAgPGRpdj4KICAgICAgICA8c3Bhbj4KICAgICAgICAgICAgPGRpdj5JIGZvdW5k
IHRoYXQgbW9zdCBvZiB0aGUgbWFjaGluZXMgaW4gb3BlbmJtYyB1c2UgYXN0MjUwMCwgYW5kIG9u
bHkgdGhlIG1hY2hpbmVzIG9mIGFzdDI1MDAgYXJlIGVxdWlwcGVkIHdpdGggcmVsYXRpdmVseSBj
b21wbGV0ZSB2aWRlbyBlbmdpbmUuIElzIGl0IHJlY29tbWVuZGVkIHRvIGltcGxlbWVudCBpcGt2
bSBvbiBhc3QyNDAwPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBsZWFybmVkIHRoYXQgdG8g
aW1wbGVtZW50IGlwa3ZtLCB5b3UgbmVlZCB0byBmaXJzdCBpbXBsZW1lbnQgLyBkZXYgLyB2aWRl
bzAsIC8gZGV2IC8gaGlkZzAgYW5kIC8gZGV2IC8gaGlkZzEsIGFuZCBJIGFsc28ga25vdyB0aGF0
IHRoZXNlIGRldnMgYXJlIGdlbmVyYXRlZCBieSB0aGUgZGV2aWNlIHRyZWUgb2YgTGludXgsIGJ1
dCBJIGRvbid0IGhhdmUgYW55IG9mIHRoZXNlIHRocmVlIGluIG15IG9wZW5ibWMuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5JIHRyaWVkIHRvIGNvbmZpZ3VyZSB0aGUgYXN0MjQwMCBhY2NvcmRp
bmcgdG8gdGhlIHJlbGV2YW50IGNvbmZpZ3VyYXRpb24gb2YgdGhlIGFzdDI1MDAgKG1haW5seSB0
aGUgZGV2aWNlIHRyZWUpLCBidXQgdGhlIHZpZGVvIGVuZ2luZSBkcml2ZXIgZGlkIG5vdCBydW4s
IGFuZCB0aGVyZSB3YXMgbm8gZXJyb3IuPC9kaXY+PGRpdj48YnI+PC9kaXY+CiAgICAgICAgPC9z
cGFuPgogICAgPC9kaXY+CiAgICA8ZGl2PgogICAgICAgIDxzcGFuPgogICAgICAgICAgICBUaGlz
IHByb2JsZW0gaGFzIGJlZW4gYm90aGVyaW5nIG1lLiBDYW4gc29tZW9uZSBnaXZlIG1lIHNvbWUg
c3VnZ2VzdGlvbnMKICAgICAgICA8L3NwYW4+CiAgICA8L2Rpdj4KICAgIDxkaXYgaWQ9Im50ZXMt
cGNtYWMtc2lnbmF0dXJlIiBzdHlsZT0iZm9udC1mYW1pbHk6J+W+rui9r+mbhem7kSciPgogICAg
IAogICAgPGRpdiBzdHlsZT0iZm9udC1zaXplOjE0cHg7IHBhZGRpbmc6IDA7ICBtYXJnaW46MDts
aW5lLWhlaWdodDoxNHB4OyI+CiAgICAgICAgPGRpdiBzdHlsZT0icGFkZGluZy1ib3R0b206NnB4
O21hcmdpbi1ib3R0b206MTBweDtib3JkZXItYm90dG9tOjFweCBzb2xpZCAjZTZlNmU2O2Rpc3Bs
YXk6aW5saW5lLWJsb2NrOyI+CiAgICAgICAgICAgICAgICAgICAgPGEgaHJlZj0iaHR0cHM6Ly9t
YWFzLm1haWwuMTYzLmNvbS9kYXNoaS13ZWItZXh0ZW5kL2h0bWwvcHJvU2lnbmF0dXJlLmh0bWw/
ZnRsSWQ9MSZhbXA7bmFtZT16MTkwODE0NDcxMiZhbXA7dWlkPXoxOTA4MTQ0NzEyJTQwZ21haWwu
Y29tJmFtcDtpY29uVXJsPWh0dHBzJTNBJTJGJTJGbWFpbC1vbmxpbmUubm9zZG4uMTI3Lm5ldCUy
RnFpeWVsb2dvJTJGZGVmYXVsdEF2YXRhci5wbmcmYW1wO2l0ZW1zPSU1QiUyMnoxOTA4MTQ0NzEy
JTQwZ21haWwuY29tJTIyJTVEIiBzdHlsZT0iZGlzcGxheTpibG9jaztiYWNrZ3JvdW5kOiNmZmY7
IG1heC13aWR0aDogNDAwcHg7IF93aWR0aDogNDAwcHg7cGFkZGluZzoxNXB4IDAgMTBweCAwO3Rl
eHQtZGVjb3JhdGlvbjogbm9uZTsgb3V0bGluZTpub25lOy13ZWJraXQtdGFwLWhpZ2hsaWdodC1j
b2xvcjp0cmFuc3BhcmVudDstd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50
O3RleHQtc2l6ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50OyI+CiAgICAgICAgICAgIDx0YWJsZSBj
ZWxscGFkZGluZz0iMCIgc3R5bGU9IndpZHRoOiAxMDAlOyBtYXgtd2lkdGg6IDEwMCU7IHRhYmxl
LWxheW91dDogZml4ZWQ7IGJvcmRlci1jb2xsYXBzZTogY29sbGFwc2U7Y29sb3I6ICM5YjllYTE7
Zm9udC1zaXplOiAxNHB4O2xpbmUtaGVpZ2h0OjEuMzstd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6
bm9uZSAhaW1wb3J0YW50O3RleHQtc2l6ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50OyI+CiAgICAg
ICAgICAgICAgICA8dGJvZHkgc3R5bGU9ImZvbnQtZmFtaWx5OiAnUGluZ0ZhbmcgU0MnLCAnSGly
YWdpbm8gU2FucyBHQicsJ1dlblF1YW5ZaSBNaWNybyBIZWknLCAnTWljcm9zb2Z0IFlhaGVpJywg
J+W+rui9r+mbhem7kScsIHZlcmRhbmEgIWltcG9ydGFudDsgd29yZC13cmFwOmJyZWFrLXdvcmQ7
IHdvcmQtYnJlYWs6YnJlYWstYWxsOy13ZWJraXQtdGV4dC1zaXplLWFkanVzdDpub25lICFpbXBv
cnRhbnQ7dGV4dC1zaXplLWFkanVzdDpub25lICFpbXBvcnRhbnQ7Ij4KICAgICAgICAgICAgICAg
ICAgICA8dHIgY2xhc3M9ImZpcnN0Um93Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0
ZCB3aWR0aD0iMzgiIHN0eWxlPSJwYWRkaW5nOjA7IGJveC1zaXppbmc6IGJvcmRlci1ib3g7IHdp
ZHRoOiAzOHB4OyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGltZyB3aWR0aD0i
MzgiIGhlaWdodD0iMzgiIHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjptaWRkbGU7IHdpZHRoOiAzOHB4
OyBoZWlnaHQ6IDM4cHg7IGJvcmRlci1yYWRpdXM6NTAlOyIgc3JjPSJodHRwczovL21haWwtb25s
aW5lLm5vc2RuLjEyNy5uZXQvcWl5ZWxvZ28vZGVmYXVsdEF2YXRhci5wbmciPgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBz
dHlsZT0icGFkZGluZzogMCAwIDAgMTBweDsgY29sb3I6ICMzMTM1M2I7Ij4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8ZGl2IHN0eWxlPSJmb250LXNpemU6IDE2cHg7Zm9udC13ZWln
aHQ6Ym9sZDsgd2lkdGg6MTAwJTsgd2hpdGUtc3BhY2U6IG5vd3JhcDsgb3ZlcmZsb3c6aGlkZGVu
O3RleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyI+ejE5MDgxNDQ3MTI8L2Rpdj4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAg
ICAgICAgICAgICAgICAgPHRyIHdpZHRoPSIxMDAlIiBzdHlsZT0iZm9udC1zaXplOiAxNHB4ICFp
bXBvcnRhbnQ7IHdpZHRoOiAxMDAlOyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQg
Y29sc3Bhbj0iMiIgc3R5bGU9InBhZGRpbmc6MTBweCAwIDAgMDsgZm9udC1zaXplOjE0cHggIWlt
cG9ydGFudDsgd2lkdGg6IDEwMCU7Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPGRpdiBzdHlsZT0id2lkdGg6IDEwMCU7Zm9udC1zaXplOiAxNHB4ICFpbXBvcnRhbnQ7d29y
ZC13cmFwOmJyZWFrLXdvcmQ7d29yZC1icmVhazpicmVhay1hbGw7Ij56MTkwODE0NDcxMkBnbWFp
bC5jb208L2Rpdj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+CiAgICAgICAgICAg
ICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICA8
L3RhYmxlPgogICAgICAgIDwvYT4KICAgICAgICA8L2Rpdj4KICAgIDwvZGl2PgogICAgPGRpdiBz
dHlsZT0iZm9udC1zaXplOjEycHg7Y29sb3I6I2I1YjliZDtsaW5lLWhlaWdodDoxOHB4OyI+CiAg
ICAgICAgPHNwYW4+562+5ZCN55SxPC9zcGFuPgogICAgICAgIDxhIHN0eWxlPSJ0ZXh0LWRlY29y
YXRpb246IG5vbmU7Y29sb3I6IzQxOTZmZjtwYWRkaW5nOjAgNXB4OyIgaHJlZj0iaHR0cHM6Ly9t
YWlsLjE2My5jb20vZGFzaGkvZGxwcm8uaHRtbD9mcm9tPW1haWw4MSI+572R5piT6YKu566x5aSn
5biIPC9hPgogICAgICAgIDxzcGFuPuWumuWItjwvc3Bhbj4KICAgIDwvZGl2PgogPC9kaXY+Cjwv
ZGl2PjwhLS3wn5iALS0+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4=

