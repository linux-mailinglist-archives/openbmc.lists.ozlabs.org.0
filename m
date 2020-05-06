Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5E1C7DB5
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 01:04:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HXG64MBPzDqnZ
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 09:03:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ICSsMWOE; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HSwl4d6SzDqMn
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 06:33:42 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id k110so2536906otc.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yVGcT0h0X55vLI3tLeN7hyYm0Y1ZmInbjkCDlF59MK4=;
 b=ICSsMWOEa36qrATdgSANW1qnOxnVEe2BFnnDGY53fEQyrmU0n0mM3fGN0m0VYpqr8U
 mjwYqAg6BbQ786868hVxxkd2IF3z+pqdg/oHlxHsC0hkSMk9bhZN5SFhUc5QAeGydeHs
 F5yKBKtHqrXhx87ZJV27hW1vGfO5JmljxlegdHBdOfPG+c1ED1/i++hFK0h2h5jOGaxT
 4VjOaqSKjg6Eb/8wOanvNT5sACly1HbnvmDGtDewOnlsN6v50WM1TgFlWwVj4Xj1gsX5
 b1wHvRxZ63XkqYoNb2oYn1pFSptF8GxJspsPvegPLOmxWfzMt5lnznjfYnWIgccuyQey
 xVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yVGcT0h0X55vLI3tLeN7hyYm0Y1ZmInbjkCDlF59MK4=;
 b=MOwIuwqmGoQaXbA7tA+3JIf6NdNIOcQCVUGBW+4YK8Nwiug/6NFLZp0d8D/Mj2hAdf
 V/NEunY2GeWBO7p3KjCGSr64qzwKcrMjMtaadsE4xmq/iVZlp2b9zZDovKgggWr11bTd
 WUEN33vtda24UpCwkNIaf1/1WLCqXZ8fnU7evG8IwtMuN4xRYnN8EFYxGGMucQuzKnzx
 iDsiHKYx6bqZRfMajxSbuadXSUVMOXCK7lt7ca92idlTXNZxD5xQ4AYkz9qCPJdLX92m
 JuWq32w6kKDfH+QvuvKEjYZ4lnNvoUfdK06SInnhEbgXDwZomPzbgnx6I3UYAc+TxQt/
 Tucw==
X-Gm-Message-State: AGi0PuZs344rSdgwLEBryqn3FpxGOst0+j6gQEE+5Q1o4T2AxWk6wGMq
 UFA7b4iMYjHpRG97RXZuYqZX90/i86iWUyzp+oU1qpcE
X-Google-Smtp-Source: APiQypIUhGZ1FGXbCTUqmOSw8aA72iq+5CBUf7mM8Eev8hDaAAJX9E08yfbOjTaz2Q/qsEvASLP+VHr6tLgqG1vnae0=
X-Received: by 2002:a25:ae48:: with SMTP id g8mr17643029ybe.18.1588796819248; 
 Wed, 06 May 2020 13:26:59 -0700 (PDT)
MIME-Version: 1.0
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Date: Thu, 7 May 2020 01:56:48 +0530
Message-ID: <CAMRErLM2Ppyvq_9dTkLC_7dV3NN7Xy4rS2ZSGVnRBvu0LbRHTg@mail.gmail.com>
Subject: hwmon sysfs entries not created for temperature in adm1278 driver
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000008189305a50096d7"
X-Mailman-Approved-At: Thu, 07 May 2020 09:01:33 +1000
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

--00000000000008189305a50096d7
Content-Type: text/plain; charset="UTF-8"

Hi,

As per adm1278 datasheet, tempeature(0xd8) supported in adm1278. But
temperature attributes not listed in the hwmon sysfs as below.

root@yosemitev2:~# cat /sys/class/hwmon/hwmon4/
curr1_highest         curr1_max_alarm       in1_highest
in1_max_alarm         in2_highest           in2_max_alarm
in_samples            power1_input          power1_reset_history
curr1_input           curr1_reset_history   in1_input             in1_min
            in2_input             in2_min               name
   power1_input_highest  power_samples
curr1_label           curr_samples          in1_label
in1_min_alarm         in2_label             in2_min_alarm         of_node/
             power1_label          subsystem/
curr1_max             device/               in1_max
in1_reset_history     in2_max               in2_reset_history
power1_alarm          power1_max            uevent


Thanks
Mani.E

--00000000000008189305a50096d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFzIHBlciBh
ZG0xMjc4IGRhdGFzaGVldCwgdGVtcGVhdHVyZSgweGQ4KSBzdXBwb3J0ZWQgaW4gYWRtMTI3OC4g
QnV0IHRlbXBlcmF0dXJlIGF0dHJpYnV0ZXMgbm90IGxpc3RlZCBpbiB0aGUgaHdtb24gc3lzZnMg
YXMgYmVsb3cuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5yb290QHlvc2VtaXRldjI6fiMgY2F0
IC9zeXMvY2xhc3MvaHdtb24vaHdtb240Lzxicj5jdXJyMV9oaWdoZXN0IMKgIMKgIMKgIMKgIGN1
cnIxX21heF9hbGFybSDCoCDCoCDCoCBpbjFfaGlnaGVzdCDCoCDCoCDCoCDCoCDCoCBpbjFfbWF4
X2FsYXJtIMKgIMKgIMKgIMKgIGluMl9oaWdoZXN0IMKgIMKgIMKgIMKgIMKgIGluMl9tYXhfYWxh
cm0gwqAgwqAgwqAgwqAgaW5fc2FtcGxlcyDCoCDCoCDCoCDCoCDCoCDCoHBvd2VyMV9pbnB1dCDC
oCDCoCDCoCDCoCDCoHBvd2VyMV9yZXNldF9oaXN0b3J5PGJyPmN1cnIxX2lucHV0IMKgIMKgIMKg
IMKgIMKgIGN1cnIxX3Jlc2V0X2hpc3RvcnkgwqAgaW4xX2lucHV0IMKgIMKgIMKgIMKgIMKgIMKg
IGluMV9taW4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW4yX2lucHV0IMKgIMKgIMKgIMKgIMKgIMKg
IGluMl9taW4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgbmFtZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBvd2VyMV9pbnB1dF9oaWdoZXN0IMKgcG93ZXJfc2FtcGxlczxicj5jdXJyMV9sYWJlbCDC
oCDCoCDCoCDCoCDCoCBjdXJyX3NhbXBsZXMgwqAgwqAgwqAgwqAgwqBpbjFfbGFiZWwgwqAgwqAg
wqAgwqAgwqAgwqAgaW4xX21pbl9hbGFybSDCoCDCoCDCoCDCoCBpbjJfbGFiZWwgwqAgwqAgwqAg
wqAgwqAgwqAgaW4yX21pbl9hbGFybSDCoCDCoCDCoCDCoCBvZl9ub2RlLyDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBvd2VyMV9sYWJlbCDCoCDCoCDCoCDCoCDCoHN1YnN5c3RlbS88YnI+Y3VycjFfbWF4
IMKgIMKgIMKgIMKgIMKgIMKgIGRldmljZS8gwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW4xX21heCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpbjFfcmVzZXRfaGlzdG9yeSDCoCDCoCBpbjJfbWF4IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGluMl9yZXNldF9oaXN0b3J5IMKgIMKgIHBvd2VyMV9hbGFybSDCoCDC
oCDCoCDCoCDCoHBvd2VyMV9tYXggwqAgwqAgwqAgwqAgwqAgwqB1ZXZlbnQ8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rczwvZGl2PjxkaXY+TWFuaS5FPGJyPjwv
ZGl2PjwvZGl2Pg0K
--00000000000008189305a50096d7--
