Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB83C4148
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 04:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNSk66XD0z306N
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 12:43:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZT8lRDUO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=adedejiadebisi01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZT8lRDUO; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKyRx3L8Lz2yxj
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 10:52:12 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id p1so9470729lfr.12
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jul 2021 17:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7mUGZM89knK3SLZ2fnWdbSUY70rlQGUTx6pPd5/hxiA=;
 b=ZT8lRDUOE6NA/Oca+vrdlE1fyM5xDkqAo8yxqFr5W2Eu9bJSqbNLei42j4QzBGuqvh
 /Ztiu/Y5qfd6EM2R6vPDfshSxMlg7u9HI9uCbqjjXNxS0HISFZaLC5QMX61hY8Fh5uoX
 iTlXUzOplMLg0j2h4qlkSU3qyAyVkQyO1u9ysME6e3m+Dfg0FGA3hjZ49y6V6RCfseLd
 xbK/KhigF2fXjKpewXpVKGUlOO2MAhbAW+Q1VDXHtZBZ/BgLGssVB+ZxgUv6xrKedukB
 Z2eE45qtxx6b+dVwVAHEYeXc16jOIOImYrwGaZ4BMdigcf1+PmppUpGJJiN335T+dM/G
 BHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7mUGZM89knK3SLZ2fnWdbSUY70rlQGUTx6pPd5/hxiA=;
 b=lKpGjZ2WSFwWaLw2q8R8ZeZeMi3lySVgaMGpQ3UbE5udUZoJ3SkghZH2/ekfQb18Gx
 docZE82MzemOuS1ueM57P6mFLcbzOelDP/+Qa/hbocG70m1hwddBWK5kS6oFirA4xyqt
 WrAfbQXxo9KLOwwaI5zAENW7FUj/4zFbskyfxdYpCn0ieHS1IDaNgs13hu6dUU8QlPbO
 0gNmGYAJLinG/9uIYNpeCKTQbtaTzstxm1WB7q+RKKazQ3GkTwgbAVNdRis1DyxD+nQC
 yGLupG8g4yu1Tx0yUHtUwvDNF1Kp7scw5EZAr484jWZU5fnhR32VhbHcEX8KASS+GlR5
 QKow==
X-Gm-Message-State: AOAM531eNEiyvnXX1xVTNnMRQsd9El0ZEnvVFXJ8Q5ZJLZeUNj5FPX1v
 ARGwMKwVwb6TjdqGsX9wcK8vbok7/R/PV6JBOIe/5OWYs7RtJg==
X-Google-Smtp-Source: ABdhPJyxnS49cO0HAXfA0AUFcGAtyDalMeVfi/okMTfS0mSyD9MwCpGIREvdp5jFBhaSsYIFoBjMA1Mz9f47dWfQiEM=
X-Received: by 2002:a19:5018:: with SMTP id e24mr2440586lfb.29.1625705522837; 
 Wed, 07 Jul 2021 17:52:02 -0700 (PDT)
MIME-Version: 1.0
From: adedeji adebisi <adedejiadebisi01@gmail.com>
Date: Wed, 7 Jul 2021 20:51:52 -0400
Message-ID: <CALy7Lc5wYitOO9J9EUzvpYVWbp7FsmOS1-6cMzOqdetSiSwfKg@mail.gmail.com>
Subject: dbus-top Design Proposal
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000032bb4005c6921068"
X-Mailman-Approved-At: Mon, 12 Jul 2021 12:42:33 +1000
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

--00000000000032bb4005c6921068
Content-Type: text/plain; charset="UTF-8"

Hello,

My name is Adedeji Adebisi and I am working on a top-like tool for dbus.
This tool will show metrics of a dbus connection, in an attempt to
understand some performance related issues.


Currently, we have a mock version of the proposed tool that runs on a PCAP
replay and below is a representation of what we have implemented so far:


+----------------------------------------------------------------------------+

|Message Type          | msg/s        History                 (Total msg/s)
 |

|Method Call             45.00        -  .       .       .       .    -2300
 |

|Method Return           45.00        -  :       :       :       :    -1750
 |

|Signal                  53.00        -  :       :       :       :    -1200
 |

|Error                    0.00        -  :       :       :       :    -650
  |

|Total                  142.99        -:::.....:::.....:::.....:::....-100
  |

+-------------------------------------+--------------------------------------+

| Columns 1-2 of 6      84 sensors    |   Msg/s   Sender  Destination
 |

|   vddq_efgh_out     vddcr_cpu1_in   |   7.50    :1.14   :1.48
 |

|   vddcr_cpu0_out    vddcr_soc1_out  |   7.50    :1.14
org.freedesktop.DB>|

|   vddq_mnop_out     vddq_efgh_in    |   7.50    :1.48   :1.52
 |

|   vddcr_soc0_out    vddq_abcd_in    |   7.50    :1.48
org.freedesktop.DB>|

|   vddq_ijkl_in      vddq_efgh_out   |   1.00    :1.48
xyz.openbmc_projec>|

|   vddcr_soc0_in     hotswap_pout    |   1.00    :1.48
xyz.openbmc_projec>|

|   vddcr_cpu0_in     vddcr_cpu1_in   |   1.00    :1.48
xyz.openbmc_projec>|

|   vddq_ijkl_out     vddq_efgh_in    |   5.00    :1.48
xyz.openbmc_projec>|

|   vddcr_soc1_in     vddq_ijkl_out   |   5.00    :1.48
xyz.openbmc_projec>|

|   hotswap_iout      vddcr_soc0_out  |   1.00    :1.48
xyz.openbmc_projec>|

|   vddq_abcd_in      vddcr_soc1_in   |   7.50    :1.48
xyz.openbmc_projec>|

|   vddq_mnop_in      vddq_mnop_in    |   7.50    :1.52
xyz.openbmc_projec>|

|   vddcr_cpu1_out    vddcr_cpu1_out  |   1.00    :1.70   (null)
  |

|   vddq_abcd_out     vddcr_cpu0_out  |   1.00    :1.70   :1.48
 |

+-------------------------------------+--------------------------------------+

 Fri Jul  2 15:50:08 2021                                    PRESS ? FOR
HELP


The design document for this project that highlights more specifications
can be found in the link below.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/44779


Please let me know if you have any questions.

Thank you for your interest in my project,

Adedeji Adebisi.

--00000000000032bb4005c6921068
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0ibW9ub3NwYWNlIj5IZWxsbywgPGJyPjxicj5NeSBu
YW1lIGlzIEFkZWRlamkgQWRlYmlzaSBhbmQgSSBhbSB3b3JraW5nIG9uIGEgdG9wLWxpa2UgdG9v
bCBmb3IgZGJ1cy4gVGhpcyB0b29sIHdpbGwgc2hvdyBtZXRyaWNzIG9mIGEgZGJ1cyBjb25uZWN0
aW9uLCBpbiBhbiBhdHRlbXB0IHRvIHVuZGVyc3RhbmQgc29tZSBwZXJmb3JtYW5jZSByZWxhdGVk
IGlzc3Vlcy4gPGJyPjxicj48YnI+Q3VycmVudGx5LCB3ZSBoYXZlIGEgbW9jayB2ZXJzaW9uIG9m
IHRoZSBwcm9wb3NlZCB0b29sIHRoYXQgcnVucyBvbiBhIFBDQVAgcmVwbGF5IGFuZCBiZWxvdyBp
cyBhIHJlcHJlc2VudGF0aW9uIG9mIHdoYXQgd2UgaGF2ZSBpbXBsZW1lbnRlZCBzbyBmYXI6PGJy
Pjxicj48YnI+Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPjxicj58TWVzc2FnZSBUeXBlIMKgIMKg
IMKgIMKgIMKgfCBtc2cvcyDCoCDCoCDCoCDCoEhpc3RvcnkgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKFRvdGFsIG1zZy9zKSDCoHw8YnI+PGJyPnxNZXRob2QgQ2FsbCDCoCDCoCDCoCDCoCDCoCDC
oCA0NS4wMCDCoCDCoCDCoCDCoC0gwqAuIMKgIMKgIMKgIC4gwqAgwqAgwqAgLiDCoCDCoCDCoCAu
IMKgIMKgLTIzMDAgwqB8PGJyPjxicj58TWV0aG9kIFJldHVybiDCoCDCoCDCoCDCoCDCoCA0NS4w
MCDCoCDCoCDCoCDCoC0gwqA6IMKgIMKgIMKgIDogwqAgwqAgwqAgOiDCoCDCoCDCoCA6IMKgIMKg
LTE3NTAgwqB8PGJyPjxicj58U2lnbmFsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNTMuMDAg
wqAgwqAgwqAgwqAtIMKgOiDCoCDCoCDCoCA6IMKgIMKgIMKgIDogwqAgwqAgwqAgOiDCoCDCoC0x
MjAwIMKgfDxicj48YnI+fEVycm9yIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMC4wMCDC
oCDCoCDCoCDCoC0gwqA6IMKgIMKgIMKgIDogwqAgwqAgwqAgOiDCoCDCoCDCoCA6IMKgIMKgLTY1
MCDCoCB8PGJyPjxicj58VG90YWwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxNDIuOTkgwqAg
wqAgwqAgwqAtOjo6Li4uLi46OjouLi4uLjo6Oi4uLi4uOjo6Li4uLi0xMDAgwqAgfDxicj48YnI+
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPjxicj58IENvbHVtbnMgMS0yIG9mIDYgwqAgwqAgwqA4
NCBzZW5zb3JzIMKgIMKgfCDCoCBNc2cvcyDCoCBTZW5kZXIgwqBEZXN0aW5hdGlvbiDCoCDCoCDC
oCDCoHw8YnI+PGJyPnwgwqAgdmRkcV9lZmdoX291dCDCoCDCoCB2ZGRjcl9jcHUxX2luIMKgIHwg
wqAgNy41MCDCoCDCoDoxLjE0IMKgIDoxLjQ4IMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj48YnI+
fCDCoCB2ZGRjcl9jcHUwX291dCDCoCDCoHZkZGNyX3NvYzFfb3V0IMKgfCDCoCA3LjUwIMKgIMKg
OjEuMTQgwqAgb3JnLmZyZWVkZXNrdG9wLkRCJmd0O3w8YnI+PGJyPnwgwqAgdmRkcV9tbm9wX291
dCDCoCDCoCB2ZGRxX2VmZ2hfaW4gwqAgwqB8IMKgIDcuNTAgwqAgwqA6MS40OCDCoCA6MS41MiDC
oCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+PGJyPnwgwqAgdmRkY3Jfc29jMF9vdXQgwqAgwqB2ZGRx
X2FiY2RfaW4gwqAgwqB8IMKgIDcuNTAgwqAgwqA6MS40OCDCoCBvcmcuZnJlZWRlc2t0b3AuREIm
Z3Q7fDxicj48YnI+fCDCoCB2ZGRxX2lqa2xfaW4gwqAgwqAgwqB2ZGRxX2VmZ2hfb3V0IMKgIHwg
wqAgMS4wMCDCoCDCoDoxLjQ4IMKgIHh5ei5vcGVuYm1jX3Byb2plYyZndDt8PGJyPjxicj58IMKg
IHZkZGNyX3NvYzBfaW4gwqAgwqAgaG90c3dhcF9wb3V0IMKgIMKgfCDCoCAxLjAwIMKgIMKgOjEu
NDggwqAgeHl6Lm9wZW5ibWNfcHJvamVjJmd0O3w8YnI+PGJyPnwgwqAgdmRkY3JfY3B1MF9pbiDC
oCDCoCB2ZGRjcl9jcHUxX2luIMKgIHwgwqAgMS4wMCDCoCDCoDoxLjQ4IMKgIHh5ei5vcGVuYm1j
X3Byb2plYyZndDt8PGJyPjxicj58IMKgIHZkZHFfaWprbF9vdXQgwqAgwqAgdmRkcV9lZmdoX2lu
IMKgIMKgfCDCoCA1LjAwIMKgIMKgOjEuNDggwqAgeHl6Lm9wZW5ibWNfcHJvamVjJmd0O3w8YnI+
PGJyPnwgwqAgdmRkY3Jfc29jMV9pbiDCoCDCoCB2ZGRxX2lqa2xfb3V0IMKgIHwgwqAgNS4wMCDC
oCDCoDoxLjQ4IMKgIHh5ei5vcGVuYm1jX3Byb2plYyZndDt8PGJyPjxicj58IMKgIGhvdHN3YXBf
aW91dCDCoCDCoCDCoHZkZGNyX3NvYzBfb3V0IMKgfCDCoCAxLjAwIMKgIMKgOjEuNDggwqAgeHl6
Lm9wZW5ibWNfcHJvamVjJmd0O3w8YnI+PGJyPnwgwqAgdmRkcV9hYmNkX2luIMKgIMKgIMKgdmRk
Y3Jfc29jMV9pbiDCoCB8IMKgIDcuNTAgwqAgwqA6MS40OCDCoCB4eXoub3BlbmJtY19wcm9qZWMm
Z3Q7fDxicj48YnI+fCDCoCB2ZGRxX21ub3BfaW4gwqAgwqAgwqB2ZGRxX21ub3BfaW4gwqAgwqB8
IMKgIDcuNTAgwqAgwqA6MS41MiDCoCB4eXoub3BlbmJtY19wcm9qZWMmZ3Q7fDxicj48YnI+fCDC
oCB2ZGRjcl9jcHUxX291dCDCoCDCoHZkZGNyX2NwdTFfb3V0IMKgfCDCoCAxLjAwIMKgIMKgOjEu
NzAgwqAgKG51bGwpIMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+PGJyPnwgwqAgdmRkcV9hYmNkX291
dCDCoCDCoCB2ZGRjcl9jcHUwX291dCDCoHwgwqAgMS4wMCDCoCDCoDoxLjcwIMKgIDoxLjQ4IMKg
IMKgIMKgIMKgIMKgIMKgIMKgfDxicj48YnI+Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rPGJyPjxicj7C
oEZyaSBKdWwgwqAyIDE1OjUwOjA4IDIwMjEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQUkVTUyA/IEZPUiBIRUxQPGJyPjxicj48YnI+VGhlIGRl
c2lnbiBkb2N1bWVudCBmb3IgdGhpcyBwcm9qZWN0IHRoYXQgaGlnaGxpZ2h0cyBtb3JlIHNwZWNp
ZmljYXRpb25zIGNhbiBiZSBmb3VuZCBpbiB0aGUgbGluayBiZWxvdy4gPGJyPjxicj48YSBocmVm
PSJodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysvNDQ3
NzkiPmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy80
NDc3OTwvYT48YnI+PGJyPjxicj5QbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IHF1
ZXN0aW9ucy48YnI+PGJyPlRoYW5rIHlvdSBmb3IgeW91ciBpbnRlcmVzdCBpbiBteSBwcm9qZWN0
LCA8YnI+PGJyPkFkZWRlamkgQWRlYmlzaS4gPGJyPjwvZm9udD48YnI+PC9kaXY+DQo=
--00000000000032bb4005c6921068--
