Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68439348DE1
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 11:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5h3Y0HBZz3bN9
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 21:21:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=E1y94XBI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E1y94XBI; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5h3H58Lpz309g
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 21:21:30 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id w70so1650866oie.0
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 03:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hMrQubjOxtgaxSsueIipgPuIITYb/Zy79c66bYV+PxI=;
 b=E1y94XBIGplNIiVirg+DOrfTtLVRI4SycjJFe7BMQnpMv1P2yKPBYTNgrJxsHAHf7R
 29wY3Tqy0u0PuOPHSgfCukgo8gFT6HhcbluC0vRGuF0f4E6Sx1oVzdsFIX2u9uPwKhc3
 LIxFeCXVaLfcZr8v8NV5u+eA6UQ6ajg8ei5Yd86GcCmVxODCDsM7CZybV96k95xydkJ7
 uEniFAar0Vu0X3iAsH59yH9ATZYQbf0AQz8Nf+SekwdhsTa9GDe92nZGle4/5eXvh+tk
 /8MDsxrlHHiHhRg5r2i6FQqRZIYBxDeWgHOAxCKaBV/dvnpSkhqwWaeG331PeWCBh4fu
 tMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hMrQubjOxtgaxSsueIipgPuIITYb/Zy79c66bYV+PxI=;
 b=B+Oh7RrYfaKqTNd9yT+QziXuVcqAgLUE4Hlod9Wm5HbYL4eT5zvMdvL/BfR9XyOe/4
 TVp4qWsH0fgBjpjbYUBJNkKuCYMtkR2yT9sExkwcVqW39fT8CzPVwv0CRYQvn9YTwzlX
 u0TqfdvZiBzLjad9V6VhUeRMVeuuKq2L3xSz116rc68XirV1iGoYL4qE+srZhSWXcaw5
 o75gbJ4OLSCKkETP3e/SuEFbtGgnXMBVlK9pZTu300uYgrOOMyxkMdT7U6OhngYaXP0v
 P48m1QFJnrDKeaONwZIUTTYbTE7Qh9qrSoB3NPu/5fy1Dcpf7MisjeCugby5MNjQCJVj
 qmxA==
X-Gm-Message-State: AOAM5319xZImkBW+qF+zR708Qs2UYpXNXtglkpDr8orshh+gyW/6Gvqf
 Ew5kFiIltuovwEbvyVe3LF9bx6rYgBWDEfSv3LU=
X-Google-Smtp-Source: ABdhPJwu5nf+xibJDJb/ZC6nSaLdHu5p08XpIWv1bItrt6YMRdS1ujp6cQjWwXh+0MUnKAohfriIQ8ZoakeOFWmFobg=
X-Received: by 2002:aca:1a19:: with SMTP id a25mr5611425oia.167.1616667685577; 
 Thu, 25 Mar 2021 03:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210308171049.3962577-1-gmouse@google.com>
 <CADVsX8-Vy=t9Y1VYqY9kLY-4EjsaUN2fNABw6JzM8noXB+SBvA@mail.gmail.com>
In-Reply-To: <CADVsX8-Vy=t9Y1VYqY9kLY-4EjsaUN2fNABw6JzM8noXB+SBvA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 25 Mar 2021 12:35:50 +0200
Message-ID: <CAP6Zq1iPKK-GB5TvJzJEHg1CZ_PQz1kDrjA96P6iUSxu8AwWPA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Fix flash layout
To: Anton Kachalov <gmouse@google.com>
Content-Type: multipart/alternative; boundary="0000000000001e678805be59c721"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001e678805be59c721
Content-Type: text/plain; charset="UTF-8"

Hi Anton,



We think that what Benjamin suggested is the best way. Adding unique dtsi
for the openbmc layout.

Usually users of Nuvoton EVB are not running openbmc and this is why we
have a different layout for their use.



Attentively you can upstream a new dts file for supporting the openbmc
layout in NPCM7xx EVB, for example google-npcm750-evb.



Thanks,



Tomer

On Wed, 24 Mar 2021 at 09:07, Anton Kachalov <gmouse@google.com> wrote:

> Gently ping
>
> On Mon, 8 Mar 2021 at 18:11, <gmouse@google.com> wrote:
>
>> From: "Anton D. Kachalov" <gmouse@google.com>
>>
>> This change follows OpenBMC partitions' naming layout.
>>
>> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>> ---
>>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 38 +++++++----------------
>>  1 file changed, 11 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> index 9f13d08f5804..55c5a89592d7 100644
>> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> @@ -78,8 +78,8 @@ partitions@80000000 {
>>                         compatible = "fixed-partitions";
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>> -                       bbuboot1@0 {
>> -                               label = "bb-uboot-1";
>> +                       u-boot@0 {
>> +                               label = "u-boot";
>>                                 reg = <0x0000000 0x80000>;
>>                                 read-only;
>>                                 };
>> @@ -88,38 +88,22 @@ bbuboot2@80000 {
>>                                 reg = <0x0080000 0x80000>;
>>                                 read-only;
>>                                 };
>> -                       envparam@100000 {
>> -                               label = "env-param";
>> +                       u-boot-env@100000 {
>> +                               label = "u-boot-env";
>>                                 reg = <0x0100000 0x40000>;
>>                                 read-only;
>>                                 };
>> -                       spare@140000 {
>> -                               label = "spare";
>> -                               reg = <0x0140000 0xC0000>;
>> -                               };
>>                         kernel@200000 {
>>                                 label = "kernel";
>> -                               reg = <0x0200000 0x400000>;
>> -                               };
>> -                       rootfs@600000 {
>> -                               label = "rootfs";
>> -                               reg = <0x0600000 0x700000>;
>> -                               };
>> -                       spare1@D00000 {
>> -                               label = "spare1";
>> -                               reg = <0x0D00000 0x200000>;
>> -                               };
>> -                       spare2@0F00000 {
>> -                               label = "spare2";
>> -                               reg = <0x0F00000 0x200000>;
>> +                               reg = <0x0200000 0x580000>;
>>                                 };
>> -                       spare3@1100000 {
>> -                               label = "spare3";
>> -                               reg = <0x1100000 0x200000>;
>> +                       rofs@780000 {
>> +                               label = "rofs";
>> +                               reg = <0x0780000 0x1680000>;
>>                                 };
>> -                       spare4@1300000 {
>> -                               label = "spare4";
>> -                               reg = <0x1300000 0x0>;
>> +                       rwfs@1e00000 {
>> +                               label = "rwfs";
>> +                               reg = <0x1e00000 0x200000>;
>>                         };
>>                 };
>>         };
>> --
>> 2.30.1.766.gb4fecdf3b7-goog
>>
>>

--0000000000001e678805be59c721
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNt
IDAuMDAwMXB0O2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMnB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWYi
PkhpIEFudG9uLDwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjow
Y20gMGNtIDAuMDAwMXB0O2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1z
ZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMnB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMt
c2VyaWYiPsKgPC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBj
bSAwY20gMC4wMDAxcHQ7Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNl
cmlmIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEycHQ7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1z
ZXJpZiI+V2UgdGhpbmsgdGhhdCB3aGF0IEJlbmphbWluDQpzdWdnZXN0ZWQgaXMgdGhlIGJlc3Qg
d2F5LiBBZGRpbmcgdW5pcXVlIGR0c2kgZm9yIHRoZSBvcGVuYm1jIGxheW91dC48L3NwYW4+PC9w
PjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtmb250
LXNpemU6MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTJwdDtmb250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmIj5Vc3VhbGx5IHVzZXJz
IG9mIE51dm90b24gRVZCIGFyZSBub3QNCnJ1bm5pbmcgb3BlbmJtYyBhbmQgdGhpcyBpcyB3aHkg
d2UgaGF2ZSBhIGRpZmZlcmVudCBsYXlvdXQgZm9yIHRoZWlyIHVzZS48L3NwYW4+PC9wPjxwIGNs
YXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdDtmb250LXNpemU6
MTFwdDtmb250LWZhbWlseTpDYWxpYnJpLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTJwdDtmb250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmIj7CoDwvc3Bhbj48L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2ZvbnQtc2l6ZTox
MXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMnB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWYiPkF0dGVudGl2ZWx5IHlvdSBjYW4g
dXBzdHJlYW0gYSBuZXcNCmR0cyBmaWxlIGZvciBzdXBwb3J0aW5nIHRoZSBvcGVuYm1jIGxheW91
dCBpbiBOUENNN3h4IEVWQiwgZm9yIGV4YW1wbGUgZ29vZ2xlLW5wY203NTAtZXZiLjwvc3Bhbj48
L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2Zv
bnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMnB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWYiPsKgPC9zcGFuPjwv
cD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7Zm9u
dC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEycHQ7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1zZXJpZiI+VGhhbmtzLDwvc3Bh
bj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0
O2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGlicmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMnB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWYiPsKgPC9zcGFu
PjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQ7
Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q2FsaWJyaSxzYW5zLXNlcmlmIj4NCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQo8L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0O2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNhbGli
cmksc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMnB0O2ZvbnQtZmFtaWx5OkFy
aWFsLHNhbnMtc2VyaWYiPlRvbWVyPC9zcGFuPjwvcD48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIDI0IE1h
ciAyMDIxIGF0IDA5OjA3LCBBbnRvbiBLYWNoYWxvdiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmdtb3Vz
ZUBnb29nbGUuY29tIj5nbW91c2VAZ29vZ2xlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+PGRpdiBkaXI9Imx0ciI+R2VudGx5IHBpbmc8L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIDggTWFy
IDIwMjEgYXQgMTg6MTEsICZsdDs8YSBocmVmPSJtYWlsdG86Z21vdXNlQGdvb2dsZS5jb20iIHRh
cmdldD0iX2JsYW5rIj5nbW91c2VAZ29vZ2xlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+RnJvbTogJnF1b3Q7QW50b24gRC4gS2FjaGFsb3YmcXVvdDsgJmx0OzxhIGhyZWY9Im1h
aWx0bzpnbW91c2VAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmdtb3VzZUBnb29nbGUuY29t
PC9hPiZndDs8YnI+DQo8YnI+DQpUaGlzIGNoYW5nZSBmb2xsb3dzIE9wZW5CTUMgcGFydGl0aW9u
cyYjMzk7IG5hbWluZyBsYXlvdXQuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogQW50b24gRC4g
S2FjaGFsb3YgJmx0OzxhIGhyZWY9Im1haWx0bzpnbW91c2VAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmdtb3VzZUBnb29nbGUuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGFyY2gvYXJt
L2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzIHwgMzggKysrKysrKy0tLS0tLS0tLS0t
LS0tLS08YnI+DQrCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlv
bnMoLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1u
cGNtNzUwLWV2Yi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0
czxicj4NCmluZGV4IDlmMTNkMDhmNTgwNC4uNTVjNWE4OTU5MmQ3IDEwMDY0NDxicj4NCi0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzPGJyPg0KKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWV2Yi5kdHM8YnI+DQpAQCAtNzgsOCArNzgs
OCBAQCBwYXJ0aXRpb25zQDgwMDAwMDAwIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7Zml4ZWQtcGFydGl0aW9ucyZxdW90Ozs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjYWRkcmVzcy1jZWxscyA9ICZs
dDsxJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjc2l6ZS1j
ZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBiYnVib290MUAwIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O2JiLXVib290LTEmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdS1ib290QDAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7dS1ib290JnF1
b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHJlZyA9ICZsdDsweDAwMDAwMDAgMHg4MDAwMCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVhZC1vbmx5Ozxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KQEAgLTg4LDM4ICs4
OCwyMiBAQCBiYnVib290MkA4MDAwMCB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnID0gJmx0OzB4MDA4MDAwMCAweDgwMDAwJmd0Ozs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWFkLW9u
bHk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnZwYXJhbUAxMDAw
MDAgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGxhYmVsID0gJnF1b3Q7ZW52LXBhcmFtJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHUtYm9vdC1lbnZAMTAwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3UtYm9vdC1lbnYm
cXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVnID0gJmx0OzB4MDEwMDAwMCAweDQwMDAwJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWFkLW9ubHk7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGFyZUAxNDAwMDAgezxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7c3BhcmUm
cXVvdDs7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnID0gJmx0OzB4MDE0MDAwMCAweEMwMDAwJmd0Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGtlcm5lbEAyMDAwMDAgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxhYmVsID0gJnF1b3Q7a2VybmVsJnF1b3Q7
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDAyMDAwMDAgMHg0MDAwMDAmZ3Q7Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcm9vdGZzQDYwMDAwMCB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtyb290ZnMmcXVvdDs7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4MDYwMDAwMCAweDcwMDAwMCZndDs7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzcGFyZTFARDAwMDAwIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3NwYXJlMSZxdW90Ozs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7
MHgwRDAwMDAwIDB4MjAwMDAwJmd0Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHNwYXJlMkAwRjAwMDAwIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3NwYXJlMiZxdW90Ozs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgw
RjAwMDAwIDB4MjAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMjAwMDAwIDB4NTgwMDAwJmd0Ozs8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwYXJlM0AxMTAwMDAwIHs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZx
dW90O3NwYXJlMyZxdW90Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMTAwMDAwIDB4MjAwMDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByb2ZzQDc4MDAwMCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDty
b2ZzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZyA9ICZsdDsweDA3ODAwMDAgMHgxNjgwMDAwJmd0Ozs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwYXJlNEAxMzAwMDAwIHs8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3NwYXJl
NCZxdW90Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgxMzAwMDAwIDB4MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcndmc0AxZTAwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3J3ZnMmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4MWUwMDAwMCAweDIwMDAwMCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCsKgIMKg
IMKgIMKgIH07PGJyPg0KLS0gPGJyPg0KMi4zMC4xLjc2Ni5nYjRmZWNkZjNiNy1nb29nPGJyPg0K
PGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--0000000000001e678805be59c721--
