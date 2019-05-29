Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A46072E08E
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 17:08:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DYy16HlDzDqJB
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 01:08:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fh21gX0i"; 
 dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DYxR4nHszDqDX
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 01:08:11 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id v25so1757740oic.9
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cV9PBUxzw3s0955o4ktu3lx/eDRlxTDuk4Fv/pzbNhI=;
 b=fh21gX0izBchfzaclopoTuO8cvyQ6OpdW4YMZc83NfhJvBliEhoZW41jjDoj1Yrm2t
 pND/7as9IJXLeENBdY5eQ6vL/W+UkJuZ5U+aC3ZIcrMQ4biTIWauqt9Abqvk3tgzuZKm
 4p0Q99C9woaixQz2FJS3WBFpOemqOji7wOBwmlnrUoxWL6M0tQhlhf/az5bfefKatYn+
 RZcXvMPK/KpCByHtVkavr7SbkC3xNyRQrRkwWXqlw6OTwSKBcWqD/Xc+rMvHIwqfpYth
 fh8U5VKQ4g3QB5uU5XAA1RNRO4rrqvTjxB/iCtJOZvwMWaVCjkVhWk73uNxQFUlCzMXS
 Jh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cV9PBUxzw3s0955o4ktu3lx/eDRlxTDuk4Fv/pzbNhI=;
 b=BjmANvYPfPjd+9tIf26X3Onl4nO+gpHsMGBseCY4P61J0KjT7Mo4pBBVMvwP9xAwCR
 p8t1976T7fCs/fkp5YxZ1G8ga1um3angBo0Dk688dAusYuqHlWLz2dWHdqNHxNrrgrRu
 UlTplJnWtViF8IK6c9IEukAYZyBx1MPKz9WS6v857AJT/ttHVgDu50F720dPvnok35ot
 7kvifr7asga/akFW0jgNzNZMS4WmHseAf9kevyDxo/ViCOJMvzjREgbp1OdIzqBxWPzH
 yi6I9b4AcsQdI14os1FNiMPMLkA0I6MK/WgL9NgK+MeNYY5qCCYISdAM+gaog5WCpsJ1
 Zibw==
X-Gm-Message-State: APjAAAXwVB5yT3JN7HzNODaZMbcsV89vtycQVNTX7t1TTmjFZ/8mM2MQ
 yP4ZlSXggMm70jKA74X4dqvH4WvKrS0+mNa0xQ77gltJ
X-Google-Smtp-Source: APXvYqxP7VVJumy3UKnJ0grQhCNdx9P8iTQYShFwQBEllZqLFABY3BDG4p75ju1PQXNP5nzLauFGzYUNUqPJl8vbw50=
X-Received: by 2002:aca:240d:: with SMTP id n13mr6221389oic.145.1559142488022; 
 Wed, 29 May 2019 08:08:08 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 29 May 2019 10:07:52 -0500
Message-ID: <CALLMt=rkJEaq0dxWqD+GCAmwttn7gN9YWOQvE-ncJunKyzdXcg@mail.gmail.com>
Subject: May 29 OpenBMC Infrastructure Workgroup Cancelled
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Not enough topics to warrant a meeting.

Andrew
