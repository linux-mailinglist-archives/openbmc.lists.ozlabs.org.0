Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B61CA084
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 04:08:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JDJz3zRBzDqmJ
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 12:08:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=park910113@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FIgEkT+H; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JDJ133gczDqmF
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 12:07:58 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id q7so196245qkf.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 19:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VqJLE8gN1s4VmHMiSXZZvD4uQisM9z164hdEfi2Afe8=;
 b=FIgEkT+HnZ5nB3pwW0qmi3eZtraGc1AilJjpM2LJcn2O+ECLncQsRZ5mf0Z8RwD74x
 5ZdHBCgbk0hFFDMjTM29f2iqH+1BgAQ1D7ryGIEHaXKA/TI/GzpvktxJDxsWUHlBSIkW
 EGCNDY8SupXnUdjiD2DlpiCm2pDKgVGUnKizKV+ePeUxUxipBb/M0DkDiNcUok4AfKKB
 9bF1Rgz/80WxptOx9eIeJSaV1rTp7dwV7IaeO6K99JrkSfh9WIwGIe9dUdYPMhTrxunF
 p7+3nThaQxo8oxPZHLX1Vhu10wOJhXzBW4IbW83J6HwgWFO+HOiH4rzN1xtEQM2hm3Yd
 paTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VqJLE8gN1s4VmHMiSXZZvD4uQisM9z164hdEfi2Afe8=;
 b=V8lKp6ZNWn9ntkDMwznHIN5YelBXUXvOY6tnrLS/P1CN14/KWF0YbG6P6InE602aDH
 K5HNdmbqefZlWxSeZ/jQPmovLVqvEbjBhJTKvpUW9sr5WAIcEB3atw/JdKWRTyWBNrdR
 HuqUcR59tysAa8erlvgy/MMIOZdQeekOQMWnoSy6Wye2f+4NtaWrkp5Hcn5CLV9onwY0
 EA9nxiZYf9Ojdi/SrD2cF81ckXDt87xLn4GIEtewA5nVkolo68PKDbAB8CohcjihrGbp
 E2zIwTAizIyDPZomlG4tomtky5jcX78O1Ao5yXD1B+bJoKB1N49Rs0GLxPBQ6uEoKw/7
 SQRg==
X-Gm-Message-State: AGi0PuZytXissjHoIpW+3aqRH8EkXhptm80X7Za3utC22N0AxlqpxwzK
 o8rXIGC9VuzDWoxWzsefkc2E/ugiE575cKm7O3vuqLhK+Zc=
X-Google-Smtp-Source: APiQypKgzvMbqngVukXlZGvFeItlZzxrDhA7wckCchUplCnxnbHQKlsq5i2Mb5ooqaa01rD8lFG2CT4Q0zwvtp9L5hI=
X-Received: by 2002:a05:620a:7ca:: with SMTP id
 10mr417792qkb.131.1588903676070; 
 Thu, 07 May 2020 19:07:56 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?67CV7LCs7JiB?= <park910113@gmail.com>
Date: Fri, 8 May 2020 11:07:45 +0900
Message-ID: <CAB-G9zsc9kmcCSxnkLY4pWLDuV2z20g4pS-pmr-UHYG7QiTkUA@mail.gmail.com>
Subject: Request to add CLA
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000031ce5105a51977eb"
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

--00000000000031ce5105a51977eb
Content-Type: text/plain; charset="UTF-8"

Dear CLA repository manager.

Could you add my individual CLA to the repository?
[CLA file link]
https://drive.google.com/file/d/1cFjNkVnMhDhXx3atH-dNPQVLQgdlRCiy/view?usp=sharing

Thank you,

Chanyoung Park.

--00000000000031ce5105a51977eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Dear CLA repository manager.<div><br></div><div>=
<div dir=3D"ltr" style=3D"color:rgb(0,0,0)">Could you add my individual CLA=
 to the repository?</div></div><div>[CLA file link] <a href=3D"https://driv=
e.google.com/file/d/1cFjNkVnMhDhXx3atH-dNPQVLQgdlRCiy/view?usp=3Dsharing">h=
ttps://drive.google.com/file/d/1cFjNkVnMhDhXx3atH-dNPQVLQgdlRCiy/view?usp=
=3Dsharing</a></div></div></div><div dir=3D"ltr"><br><div dir=3D"ltr"><div>=
Thank you,</div><div><br></div><div>Chanyoung Park.</div></div></div></div>=
</div></div></div>

--00000000000031ce5105a51977eb--
