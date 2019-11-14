Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B50CFC149
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 09:12:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DDjh4H6NzF4R9
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 19:12:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=acceleronlabs.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-yw1-xc33.google.com; envelope-from=felixkj@acceleronlabs.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=acceleronlabs.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=acceleronlabs-com.20150623.gappssmtp.com
 header.i=@acceleronlabs-com.20150623.gappssmtp.com header.b="kQxkIYS/"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DDht6f53zF1ft
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 19:11:37 +1100 (AEDT)
Received: by mail-yw1-xc33.google.com with SMTP id r131so1602344ywh.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 00:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=acceleronlabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=U5VbEsGY1+GGELzAdtNPw82aH1zIfzC2eXJf3iJOc6c=;
 b=kQxkIYS/MdyAka5Ao21HiD6xgfaI+DMzFIH4O5iWV+onq3uXrl3DiXp/GxgN6r2EYX
 T/qFh+zeuCNT2sFIBE1aQTeVfHVal9ac4tprg/msyCk9HM1rTDSWdPJbJEe92TdYVYib
 gZE4/6aKtgjh8hY/jHnEOilWNXkdBj7Lr6/x7bdFW3UisZjqlJXMcLx3xt//ApVn9eZw
 kny82g6g+jeiU0dYnIHMADk1PU7u0zA+PrELDkax/+QgpthSOT6Nlr7by2RZiof267l0
 prHAhz2hKc1LeHTatUuAnllPJDFR2t78/bI4q0ggnKj0nIJv61B7wvZKbSKvskKRzA3L
 6CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=U5VbEsGY1+GGELzAdtNPw82aH1zIfzC2eXJf3iJOc6c=;
 b=s7bxoCH0tfm/E40uM2/CoJ/KEVuo1O43UNrH8NBFlEqHAiljBrer2/OZJ8wHK34Od0
 m8BMKcf8oaY59wnkIKbTAMH1SJH5qq7ksVRXP97frrdPlHwJVffFhf0a8JWbOppsHTbb
 xetw8S2/4KrZ6aXsjCWEJg4Tk+SP8c64iQtM5+chPIoUPtzTejxnbprPiWgA6gdVDuaF
 fI+O/VX0fHDZXZhXacjE8A2ZXqQp+cFh6ecufiJp8DPEVrw/iA7skk93IeSMCpuIZwB8
 x/kyJkpkrjemu4jTOG7w2397ramaXz0gVYJD/OXY03K2hlpqqnC9FHpOXA4YYGWi0ine
 Ck+g==
X-Gm-Message-State: APjAAAXyyXjBJtxvDMvA3EOmqYjd/nyW/gklw5pFpzmn6tfzGdbBwkG1
 eHlaQ/5MsU1DWJeG+6zWhEMXlAkmCVHjLha4gpjBt5bHaa0=
X-Google-Smtp-Source: APXvYqz4nN9XGwXob1bJhMiAX4fAIqSuloyM0fvgZDQWrdA0yCAUe1SZk6VLVO+VvKUL9zXSdI1t5uvVKcvaWBE1Ipw=
X-Received: by 2002:a81:6986:: with SMTP id e128mr4711045ywc.505.1573719093788; 
 Thu, 14 Nov 2019 00:11:33 -0800 (PST)
MIME-Version: 1.0
From: Felix K J <felixkj@acceleronlabs.com>
Date: Thu, 14 Nov 2019 13:41:16 +0530
Message-ID: <CALq0sFcracsNvrASOWFV-D96=-EvR_tVC9ADKzEGRumAm4gwJQ@mail.gmail.com>
Subject: obmc-kvm for ast2400
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008ff6c505974a0714"
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

--0000000000008ff6c505974a0714
Content-Type: text/plain; charset="UTF-8"

Hi,
     I have a custom bmc board which is based on microsoft-olympus with
ast-2400, and I'm trying to enable the obmc-ikvm. I've enabled kernel
configs related to v4l and have also added video in dts and dtsi files. But
an error occurs as the driver is loaded which is

[    0.132353] videodev: Linux video capture interface: v2.00
[    3.039313] aspeed-video 1e700000.video: Unable to get ECLK
[    3.045344] aspeed-video: probe of 1e700000.video failed with error -2

my dts file updates is given below:-
gfx_memory: framebuffer {
                        size = <0x01000000>;
                        alignment = <0x01000000>;
                        compatible = "shared-dma-pool";
                        reusable;
                };

                video_engine_memory: jpegbuffer {
                        size = <0x02000000>;    /* 32MM */
                        alignment = <0x01000000>;
                        compatible = "shared-dma-pool";
                        reusable;
                };

my dtsi updates is given below:-
video: video@1e700000 {
                                compatible = "aspeed,ast2400-video-engine";
                                reg = <0x1e700000 0x20000>;
                                clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
                                         <&syscon ASPEED_CLK_GATE_ECLK>;
                                clock-names = "vclk-gate", "eclk-gate";
                                resets = <&syscon ASPEED_RESET_VIDEO>;
                                interrupts = <7>;
                                status = "disabled";
                        };

gfx: display@1e6e6000 {
                                compatible = "aspeed,ast2400-gfx", "syscon";
                                reg = <0x1e6e6000 0x1000>;
                                reg-io-width = <4>;
                                clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
                                resets = <&syscon ASPEED_RESET_CRT1>;
                                status = "disabled";
                                interrupts = <0x19>;
                        };

what may be the error or what do i miss here...???

Felix K J
AcceleronLabs Pvt Ltd
Bangalore

--0000000000008ff6c505974a0714
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj7CoCDCoCDCoEkgaGF2ZSBhIGN1c3RvbSBibWMgYm9hcmQg
d2hpY2ggaXMgYmFzZWQgb24gbWljcm9zb2Z0LW9seW1wdXMgd2l0aCBhc3QtMjQwMCwgYW5kIEkm
IzM5O20gdHJ5aW5nIHRvIGVuYWJsZSB0aGUgb2JtYy1pa3ZtLiBJJiMzOTt2ZSBlbmFibGVkIGtl
cm5lbCBjb25maWdzIHJlbGF0ZWQgdG8gdjRsIGFuZCBoYXZlIGFsc28gYWRkZWQgdmlkZW8gaW4g
ZHRzIGFuZCBkdHNpIGZpbGVzLiBCdXQgYW4gZXJyb3Igb2NjdXJzwqBhcyB0aGUgZHJpdmVyIGlz
IGxvYWRlZCB3aGljaCBpc8KgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5bIMKgIMKgMC4xMzIz
NTNdIHZpZGVvZGV2OiBMaW51eCB2aWRlbyBjYXB0dXJlIGludGVyZmFjZTogdjIuMDA8YnI+WyDC
oCDCoDMuMDM5MzEzXSBhc3BlZWQtdmlkZW8gMWU3MDAwMDAudmlkZW86IFVuYWJsZSB0byBnZXQg
RUNMSzxicj5bIMKgIMKgMy4wNDUzNDRdIGFzcGVlZC12aWRlbzogcHJvYmUgb2YgMWU3MDAwMDAu
dmlkZW8gZmFpbGVkIHdpdGggZXJyb3IgLTI8YnI+PGRpdj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0i
Z21haWxfc2lnbmF0dXJlIiBkYXRhLXNtYXJ0bWFpbD0iZ21haWxfc2lnbmF0dXJlIj48ZGl2IGRp
cj0ibHRyIj48YnI+PC9kaXY+PGRpdj5teSBkdHMgZmlsZSB1cGRhdGVzIGlzIGdpdmVuIGJlbG93
Oi08L2Rpdj48ZGl2PmdmeF9tZW1vcnk6IGZyYW1lYnVmZmVyIHs8YnI+wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgc2l6ZSA9ICZsdDsweDAxMDAwMDAwJmd0Ozs8YnI+wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWxpZ25tZW50ID0gJmx0OzB4MDEwMDAwMDAm
Z3Q7Ozxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0g
JnF1b3Q7c2hhcmVkLWRtYS1wb29sJnF1b3Q7Ozxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCByZXVzYWJsZTs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+PGJy
PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZpZGVvX2VuZ2luZV9tZW1vcnk6IGpwZWdidWZmZXIg
ezxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaXplID0gJmx0OzB4MDIw
MDAwMDAmZ3Q7OyDCoCDCoC8qIDMyTU0gKi88YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYWxpZ25tZW50ID0gJmx0OzB4MDEwMDAwMDAmZ3Q7Ozxicj7CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7c2hhcmVkLWRtYS1wb29s
JnF1b3Q7Ozxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXVzYWJsZTs8
YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5teSBkdHNpIHVwZGF0ZXMgaXMgZ2l2ZW4gYmVsb3c6LTwvZGl2PjxkaXY+dmlkZW86IHZpZGVv
QDFlNzAwMDAwIHs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLXZpZGVvLWVuZ2luZSZxdW90
Ozs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVn
ID0gJmx0OzB4MWU3MDAwMDAgMHgyMDAwMCZndDs7PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsb2NrcyA9ICZsdDsmYW1wO3N5c2NvbiBBU1BFRURf
Q0xLX0dBVEVfVkNMSyZndDssPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OyZhbXA7c3lzY29uIEFTUEVFRF9DTEtfR0FU
RV9FQ0xLJmd0Ozs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgY2xvY2stbmFtZXMgPSAmcXVvdDt2Y2xrLWdhdGUmcXVvdDssICZxdW90O2VjbGstZ2F0
ZSZxdW90Ozs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVzZXRzID0gJmx0OyZhbXA7c3lzY29uIEFTUEVFRF9SRVNFVF9WSURFTyZndDs7PGJyPsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludGVycnVwdHMg
PSAmbHQ7NyZndDs7PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmdmeDog
ZGlzcGxheUAxZTZlNjAwMCB7PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQwMC1nZngmcXVvdDss
ICZxdW90O3N5c2NvbiZxdW90Ozs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmVnID0gJmx0OzB4MWU2ZTYwMDAgMHgxMDAwJmd0Ozs8YnI+wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnLWlvLXdpZHRoID0g
Jmx0OzQmZ3Q7Ozxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBjbG9ja3MgPSAmbHQ7JmFtcDtzeXNjb24gQVNQRUVEX0NMS19HQVRFX0QxQ0xLJmd0Ozs8
YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzZXRz
ID0gJmx0OyZhbXA7c3lzY29uIEFTUEVFRF9SRVNFVF9DUlQxJmd0Ozs8YnI+wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RhdHVzID0gJnF1b3Q7ZGlzYWJs
ZWQmcXVvdDs7PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGludGVycnVwdHMgPSAmbHQ7MHgxOSZndDs7PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIH07PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+d2hhdCBtYXkgYmUg
dGhlIGVycm9yIG9yIHdoYXQgZG8gaSBtaXNzIGhlcmUuLi4/Pz88L2Rpdj48ZGl2IGRpcj0ibHRy
Ij48YnI+PC9kaXY+PGRpdiBkaXI9Imx0ciI+RmVsaXggSyBKPGRpdj5BY2NlbGVyb25MYWJzIFB2
dCBMdGQ8L2Rpdj48ZGl2PkJhbmdhbG9yZTwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjwv
ZGl2Pg0K
--0000000000008ff6c505974a0714--
