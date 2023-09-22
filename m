Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA607AB107
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 13:38:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PCTV6F5i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsVdw1LFnz3dDr
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 21:38:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PCTV6F5i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsVdL449Rz3ckG
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 21:38:13 +1000 (AEST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-45270220069so909935137.3
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695382690; x=1695987490; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vUgX4U1nDqbgagySgU1QRculQUZhCufDpVd955ye1oU=;
        b=PCTV6F5icD1sk9+irpb0wf+cBRAKCQsIbRddRlTDZ/cY+HMKcr6ziUM0G1bUwF5RnW
         N4KrsHvTjRh6Rmj9EgeKOT1ns25Dcpmg6ywez0AEUFX28fd1MBGzhYynWCv30MvZ0CcH
         4Mb3xsloqZD3fzrrGr39xrui1pQJJ4OUXFzQasyWGJhABoXbGUGuD+6bgb9VdjagbVlY
         pmcCd2MBlVsPO9bNwDl1OW/EGuuUvHT25iJZb56JCDQ/xCjIlNAcagPuyjFbi1gc8+wD
         bHhOfSD+tbwP/3pE9xu+biWJAFkQnQG6Ug5TlL7Lf5HioRsfQWuR+84h8cc8PTHlkhgf
         e5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695382690; x=1695987490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUgX4U1nDqbgagySgU1QRculQUZhCufDpVd955ye1oU=;
        b=I6S00uTz/7sDO4/PCjROL/dzeClwsp9d7JcwihHQzfz/im3YkFI9Zaq9HHlFXY/GRK
         ydoMKTGGSbdVIi9QRuUbTyOcw9ldpUbAVg0hiO+3PXCWUDaWYytFRlQYHVe/0IXO7mxN
         uHFl60aCubKeG1QgUp/X+dRSsk8l2gC4hM9rRF+VggVGZt+UDMqaspO8Yk9WfAg73aGZ
         1tCd7+Zm8YgbfXTT9osv41nR8DsPngBox+2OsbqHaenoQNflk2Adw32RIcso46W40r3E
         xtkhgt43fkEUI76C6V3uvV39lPLaNIT/ihdNrx4OjTjKjLrjnisFJIiY796D5ucyc4xC
         7A8g==
X-Gm-Message-State: AOJu0YxzD6gyzLZ7YT/IKfcrQU676KiWmj5IJ3vZ8SqQv13cgrYoAXQ8
	hV0QE0r8I+hI0hvPosPXO0yPZJZzhvdO0Q3KEXk=
X-Google-Smtp-Source: AGHT+IGIqGChB6cFXllrHUdzdpIdQVOVkFS2UF0Y14Lbfg8SJ76iH1CyhIQdNFhrHSC5b81fr8ojrgimHPbvL8Dfj8c=
X-Received: by 2002:a05:6102:7ae:b0:452:8452:8a90 with SMTP id
 x14-20020a05610207ae00b0045284528a90mr8260920vsg.0.1695382689830; Fri, 22 Sep
 2023 04:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230922062405.2571850-1-milkfafa@gmail.com> <86729293-ad37-4f2e-bff7-c49d166e02df@xs4all.nl>
In-Reply-To: <86729293-ad37-4f2e-bff7-c49d166e02df@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Fri, 22 Sep 2023 19:38:01 +0800
Message-ID: <CADnNmFoXBA7mbs2zNFWOCYaP1TheS50E9vTdSH3uhjea=RuALQ@mail.gmail.com>
Subject: Re: [PATCH v16 0/7] Support Nuvoton NPCM Video Capture/Encode Engine
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

Thank you so much for your review and time.

Regards,
Marvin
