Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3475D131A38
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 22:18:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s7dp2sm6zDq99
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 08:18:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GQiqBuYF"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s7cn56bbzDq7g
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 08:17:04 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id c16so16917170oic.3
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 13:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pm93VW25wdF59OUrNbD3bQV/TRY5JJTTfgFNk+yxwZE=;
 b=GQiqBuYFIwYbURL21ybjzy5IRCkzhMljJvETWOfpPMI2VtTKodZD1+3R5v3ndviKlt
 r9/j76gcvIP4qIGgOmj+SqKYKxDGzMcXvpSzIDFC0y5d72xKv/2VcfW80lZeT5Uf5RS8
 /b9ON7HzHPbVVeBp3yHigISlcV7NkCms9kdRw/6hQidfRtn1moL0i8HfRnkosE/1LHcy
 kUfqHnp55Xb+K3hUkIpsf3F0lhnBCPV7v6Bd8lgZMMcSBtNywbeNRnTIHTu84CIwR18U
 DwyUDgPEoKpgvO4KBV07VfR8gzxQ/NC57fcabJkVusmURL/z7+0Ezo54BTjMpOLoGg7X
 HB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pm93VW25wdF59OUrNbD3bQV/TRY5JJTTfgFNk+yxwZE=;
 b=WR4mL54ZRqPhdEU9NLj2cxt78YqBzR2wU4oB1AiplesMybk4TIibhnqnggIWyfSig+
 t/1VctXkmfGcRFNkKy60cNzA1swUyZqXhgPhWAbCSvBxmjLdnXqG8xFvE8Z4IGkzcXj6
 MmlTKlolllarQ8gFDJ768RIkJfEplkUPXBC8KlcN9aeUJTfeLF6iy5cuydxxNdSIdpB1
 Vi3HfPysmGYansMkyfIMCGRivIIommtogZrYOefiTLMYTbgKNK6oR7mgGC77f2WScNaB
 KHwV8pN/cLx8zfTiw2VWEtxtf8uxx8p1+ObnUEV4yp1w06d0iWUwnUL2Bd4JFinlFunY
 bUZA==
X-Gm-Message-State: APjAAAWwWEYfiR+T2CzPMRoV8eQPgsgrzl4f3phSju4GMa65JmHJiwSX
 HirG0kGfOlZKhEgbLoV11/6/Vgje4DEQsEVV4XrQQbqWnJDeug==
X-Google-Smtp-Source: APXvYqxJtx7lW8NmpylYBBxx8rAVqtEAdLD6nY3HRgXrygkEUkt6+LkZ1Ys/QD2NY+HlD1ujOdgNWYGFJV0RYA4jdJo=
X-Received: by 2002:aca:34c1:: with SMTP id b184mr6548884oia.62.1578345421217; 
 Mon, 06 Jan 2020 13:17:01 -0800 (PST)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Mon, 6 Jan 2020 13:16:50 -0800
Message-ID: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
Subject: Configuring shunt_resistor in hwmon
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002a9cb2059b7f2ed9"
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
Cc: Josh Lehan <krellan@google.com>, Kais Belgaied <belgaied@google.com>,
 Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002a9cb2059b7f2ed9
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC folks,

Is there a way to configure the shunt_resistor value for a hwmon with
entity-manager or other modules? We need to configure this value to make
the INA230 report correct voltage, but for now I don't find anything in the
code for it. Shall this be a feature to implement? Thanks!

- Alex Qiu

--0000000000002a9cb2059b7f2ed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC folks,<div><br></div><div>Is there a way to con=
figure the shunt_resistor value for a hwmon with entity-manager or other mo=
dules? We need to configure this value to make the INA230 report correct vo=
ltage, but for now I don&#39;t find anything in the code for it. Shall this=
 be a feature to implement? Thanks!</div><div><br clear=3D"all"><div><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr">- Alex Qiu</div></div></div></div></div>

--0000000000002a9cb2059b7f2ed9--
