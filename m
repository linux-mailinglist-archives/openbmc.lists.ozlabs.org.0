Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6F56CF55
	for <lists+openbmc@lfdr.de>; Sun, 10 Jul 2022 16:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lgpds5z8Tz3bqk
	for <lists+openbmc@lfdr.de>; Mon, 11 Jul 2022 00:03:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TvO+n4YI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=srid.11486@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TvO+n4YI;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgpdT0HkBz3bc5
	for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 00:03:24 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id h62so2345994ybb.11
        for <openbmc@lists.ozlabs.org>; Sun, 10 Jul 2022 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=CKJFdLMznFXDXekUJIGdxjJQ2OucH5x/2ncxSXqpP7Q=;
        b=TvO+n4YIo0VwGdU+SPlMktxh3zliHIvjJaSBMoc7PXefRXMbdndNGJRjab/D9fxTWu
         HKweonprCaYJNaD0ycxALoTQ8yi0aLBly4BRbzsMFNwk3vSNlQRyMPf8vObdSt7iB/a1
         txviaXK41dSlbRxbbIdsNnCeAN/yq5N1ZZn+wcZrvL5u9b2IMa/ZKcDxqz1CfAPezcMh
         QYCAjHAkwLV1V3NBlWhYhDnohHqlo+cdfcCsv4JOV2EUwJ4In0EcRjPyKcVQmAQGmG0z
         3aByJh4UkmyGBsrKmHSHX6vFmTs5S3Luu6jCFs7TYIn0T8qfbx/C+8vwmj2jV3+/99DR
         FQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CKJFdLMznFXDXekUJIGdxjJQ2OucH5x/2ncxSXqpP7Q=;
        b=uLt/+oK+HyJmuKbGUJHEqodY7yiYE5RsDsON9sCV6UuXIifH2RYcLhXRcLFs3q6ydU
         Il2uHlTF59oaY83nfjKjw//zdv3jGKY87s4l2zp6ROSHLHAqsZqQ7hzdOpvbAej4cbMH
         F3wiksBPkJk83sNBYoBKriCM4DsWL6CD71kVPF9gZxr6dWtX38kf/p6e/22VZ9co+otu
         q14jeFkiLYJCx2j9MyuwO4Kyty2LgALczqPhw5SwIom0/uw1DTKiaknT9EYfY+h517ch
         FYpoZEii5nV0SEJZQEnVhhyLPQ5dURASCA7RZhYi7BiRGlylztINQFoLoCE0FSSJRBQq
         B1dA==
X-Gm-Message-State: AJIora87iaD4y86dlx5+e7VlJrLWBWRtD6IJC5Pch9VCmvHZYC01JtWq
	U6i5e85J3z7jDt/j/RRZf1vIpGi0O7oEhhlzYMS/Dp5MR/c=
X-Google-Smtp-Source: AGRyM1s46LXcxuuw/wo/2fimUmUHrorvDuEvZMQMqnki0g4m+Vwk/PIQH4AalQSumIrHE/v46Nuh2/tsFienEZ/nxCk=
X-Received: by 2002:a25:6d45:0:b0:66e:d5a3:6895 with SMTP id
 i66-20020a256d45000000b0066ed5a36895mr12555317ybc.174.1657461800173; Sun, 10
 Jul 2022 07:03:20 -0700 (PDT)
MIME-Version: 1.0
From: Jayashree D <srid.11486@gmail.com>
Date: Sun, 10 Jul 2022 19:33:09 +0530
Message-ID: <CALXuKJfX+xJDuFpQ0B66Sj6-7kO8Et_r8Xyi3x9id7UN50uOKg@mail.gmail.com>
Subject: UDEV events to daemon
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d4051805e373e5fa"
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

--000000000000d4051805e373e5fa
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am working on the udev rules events. When the kernel is started booting,
based on the SUBSYSTEM match in udev rules, udev events are created. I am
able to receive the udev events for an application. But I need to send
those received udev events to an application to create the dbus path based
on the event generated.

Could anyone please provide your suggestion on how to send the udev events
to the daemon using udev rules or any reference for this approach ?

Thanks,
Jayashree

--000000000000d4051805e373e5fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi Team,</div><div><br></div><div>I am=
 working on the udev rules events. When the kernel is started booting, base=
d on the SUBSYSTEM match in udev rules, udev events are created. I am able =
to receive the udev events for an application. But I need to send those rec=
eived udev events to an application to create the dbus path based on the ev=
ent generated.<br><br></div><div>Could anyone please provide your suggestio=
n on how to send the udev events to the daemon using udev rules or any refe=
rence for this approach ?<br></div><div><br></div><div>Thanks,</div><div>Ja=
yashree<br></div></div>

--000000000000d4051805e373e5fa--
