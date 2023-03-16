Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 813286BD841
	for <lists+openbmc@lfdr.de>; Thu, 16 Mar 2023 19:38:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pcwy434vmz3cf2
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 05:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JhcWNYY5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com; envelope-from=theactualdbashaw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JhcWNYY5;
	dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcwxR3Twcz3cMk
	for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 05:38:01 +1100 (AEDT)
Received: by mail-vs1-xe32.google.com with SMTP id o2so2357928vss.8
        for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2023 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678991877;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0e/uvacDVOcYZ+8RO9hJL73Ibo4hF2K4gx5iVDEo9Qk=;
        b=JhcWNYY5RrMZlZgHXwiWEz6aBxYVRza702Qy/KP4hD2Tvkee9GuVRvqorR35ae5UkT
         FuRkrwYrB82xltj9lf3okX8JFePl05/JgYyWER7j7YUhvIS6s5SQdc/Jg3Wu5pNHsX1z
         0Ax56T76Urrl/a+aFy+X2oKRhmAuloS2Ehi6Vw5y0UYlPRx53t8xbGdZ2Rpv+ENScujE
         BC4ubHylOhoxDFsmKUj3ZGL+DdIze7bk6YDQBlY9mOzROJrUVUZUxl1KQI8bPyFovbD6
         p3BEWstzxJJqi/9xBV5g/0O0JL5yOD5RU+viCFmlIG2ps7keqaVmSQ2f7mo/K+ADzQyb
         GBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678991877;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0e/uvacDVOcYZ+8RO9hJL73Ibo4hF2K4gx5iVDEo9Qk=;
        b=N7uHUpxoxXkKrReAJrUxfBGpOUypb+MzZrRcc4M0XCY9c88u4QKRwex2A4GBHtPZkB
         o1vDgu443cyDCUFQwYZA9Zf/Yf5zzhW1t9P50YZCP6hQt6KsV/vJnexY+wbL48l1lZYO
         W9pRJ0xu3yG6EvV8QZe30qiGlh3T5fgmBryNhBlqfBq4Zi4Se9EAF1tyPHgOtK1r5Jh+
         LjwMvq0DVewh+ibJDFEeS158AKJB/dh05v+0FCVDxnviAI4jkpzITB/Zn2CFOG1UuIUM
         rYzxCruiwyuLlmKyfXXdGDV40C3ds0+E/NcWZDYXqYcpGf1SXR3TaH9l7xh+5haIKNv2
         OBRw==
X-Gm-Message-State: AO0yUKWdpzEUJ9mtq9+/F7WDTaRNh8gaRE9BVxoOR1qrzy5HH1i32MSS
	H4vhlYhjNilWsMx3PwRj6daN7KHKva7aGAv03x++L6gy0yk=
X-Google-Smtp-Source: AK7set94vMJM4c+CbYRvsm529kI1JxlF/ixW50o5j0UEVTQzoCEJpq6dmalDjL8N/B75OwwETuwuU41Hg1mQyzC8Udk=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr28863721vsk.3.1678991876631; Thu, 16
 Mar 2023 11:37:56 -0700 (PDT)
MIME-Version: 1.0
From: David Bashaw <theactualdbashaw@gmail.com>
Date: Thu, 16 Mar 2023 11:37:45 -0700
Message-ID: <CAB7+d-n1ZW4ZAvUZUXdtG1XfSwjajJ4_YNmqAbu98FMui4=q2g@mail.gmail.com>
Subject: Howto Add A Single File To evb-ast2500 rootfs
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000063301805f708c2f2"
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

--00000000000063301805f708c2f2
Content-Type: text/plain; charset="UTF-8"

I am new to Yocto and am trying to figure out how to add a simple shell
script to the rootfs bin directory with no luck so far.

Tried adding a .bbappend file but got warnings about that.
How can I add this file for evb-ast2500 target?

/DJ

--00000000000063301805f708c2f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am new to Yocto and am trying to figure out how to add a=
 simple shell script to the rootfs bin directory with no luck so far.<div><=
br></div><div>Tried adding a .bbappend file but got warnings about that.</d=
iv><div>How can I add this file for evb-ast2500 target?</div><div><br></div=
><div>/DJ=C2=A0</div></div>

--00000000000063301805f708c2f2--
