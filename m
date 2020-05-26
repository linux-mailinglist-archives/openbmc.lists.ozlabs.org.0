Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC71E2237
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 14:48:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WYf64q4NzDqHb
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 22:47:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LBN4vLOS; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WYd56mxbzDq63
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 22:47:03 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id c75so10040911pga.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 05:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=96xX4DsZZu/XIHDh0T1rUvXs/YfPHVK2CZ1ygOB/SvU=;
 b=LBN4vLOSWkjT4ysWkS8z+jZmbnc2uEVV+Au+HBan6Mf70SgILpvivR6D8nK58QoBMj
 p76sqwH9jxn/gDyEI3vW8TSVU6LS75CRklZghJucwE8D5dADA+Z+3A+C0MbuUGXZgM84
 cRVTDoVwyesAbWckv6EGpZ//jGmiEWxkOIDY1ZXObDeJCQ5kIOw349WaOTVdDBsoZpE9
 TZo0ifE5FAc4E8ErO2EwypQCFNJPowKyT2Q9kbMZI80M7nVEkJa7lrQbZRJdvtaUDyZi
 7YYNpkQrz2k7eqF3WsReGp5tgZH9u5H0ybQNEKxJVmuEeMP7ETN/moYCZHCnIsV8cc/I
 7PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=96xX4DsZZu/XIHDh0T1rUvXs/YfPHVK2CZ1ygOB/SvU=;
 b=DQpx0ZVKq1fczSzr10RhFrKCX6DoThnySqg+jCNdtFoccb4WHa2IQZ/yyL0Nm5vEM4
 K68mWTinuUkAx48Vq56fDNstdV5pPu63Nh4fecvzykkIg/Vg1paDbc+PtqgKBrCrr+N0
 INV2hFOk9MPQUfc9/IuljQg+n8MhV32d+v3tb0D9831FnLAwkryyQF4kpcRTJJE7jzAD
 TRKl0r863PXe+G+DE3mv8kNJh501yGF6lhVtstRNMQCU3aW75S5Ia2LKvaiRT6aJWLAr
 CIGBpINPVJVIm83ZZgxSoD9gZInKtTaiBZBi0ro+1R+krRxmN5OCFQ3dTfrPU3iHbTeV
 OZOg==
X-Gm-Message-State: AOAM530Q+fbj7fOnFI5A7rsee3FnYQt+umw96f28hXq0qNz/ojnE7NSE
 7WyWUprXiFWGXnW8alnW8rQDpCLzYfHrZm3QEzwk8SIq
X-Google-Smtp-Source: ABdhPJy3aYg8mOqZfHkq67kBHu3OTQtM5zzPyCkUrbICfOa8cm+VTPHhNaQ3U2EgH4hBEaPwtfW3uHHzbbs8FzyIBkI=
X-Received: by 2002:a62:543:: with SMTP id 64mr6505085pff.271.1590497219358;
 Tue, 26 May 2020 05:46:59 -0700 (PDT)
MIME-Version: 1.0
From: Zbyszek <zbigniewku@gmail.com>
Date: Tue, 26 May 2020 14:46:48 +0200
Message-ID: <CAB_SOc5KK9D5TGiJZ=LFBF4Y8_dibp1iRZbvenyfscW+gkVEYA@mail.gmail.com>
Subject: power capping values on dbus
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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

Hi everyone!

I would like to expose on dbus values like min and max power capping.
These values could be read from files provided by hwmon like:
   power[1-*]_cap_max,
   power[1-*]_cap_min
which are describe here:
https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface

I have noticed that this interface:
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml
is already exposing something like MinValue and MaxValue,
but current implementation in dbus-sensors always sets these
attributes to some const values.
My understanding of the power capping values is that they could be used as these
MinValue and MaxValue if hwmon provides them otherwise some default
should be used as it is now.


My questions:
1. Should I create a new interface for the capping readings?
2. Or should I extend the existing Value.interface.yaml with new
attributes like MinCapValue, MaxCapValue?
3  Or the correct approach would be to read the cap values if provided
and expose them under already existing MinValue, MaxValue?


Regards,
Zbigniew.
