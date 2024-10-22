Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6ED9AB7A9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 22:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY3m5176Fz3c52
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 07:33:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729629202;
	cv=none; b=e5Bfcukv4pJaQrNfd/iEeM8iTU35wqz4pMz4y2XmMMFYxBuBloJO0mXf44JqaW84xMJh+MT1WKk45lU9ul3ErfFDHzhvYquzSRrfMtizntKiFNMwiqUfYA9NWqxX9IQMOhnSiSLalbJZUPW5Y78V2dVD/lbx0DnJ2LhSueU2U08XhL/kbB7AWzwlMU8/QKUqIW7gxUMVYXyfCUjILKxfpnzp9K7w7lv0HAiHmnveBOg0go57XNkcGy/4Avz2h/Vz5BLyPOIIEDsp0g/AhKk+41oU57XCfNPYnAnbARbCrD4BWJaZf7hX/GZkqRHULqZ96nnFL/qhV57BBkrKh12QHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729629202; c=relaxed/relaxed;
	bh=HlQnp0Ek8CC7LCfhrHz4NaUjsHu6T9Ed7wLFFbYbEpk=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=FeqMznxN1BKBEVLtOQ/5Xmc0v29OvMGIWJZE49PhQ1N5JVT32AGRXbouezRfI6t+KCgvOIjVSNbxFXtLBgFYXB+kFoU8GqTRV5m1WUJhi+/uVJZy8BmbCI/UrXYihjnSD8EAB3zYMaowfxnEI6uMekgWMVJDbxvMPdmp5WrH761/WgARiUgmmm0LdqZKNK0R8RSKXddNIHGl/KdYmTYyEpZhml1q4K3F8f2OjZr58HMwAHXn1JpWsc6QurgiDG35maf4txeiGr6HmSVGzbz5mGZhTjjSO2bg/TiTZaLZvKEfpYoWqifkMLH1O6WR3S9TDE2pMqWfs69WcDnOzixj6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BbCew2Uv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=richard.purdie@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BbCew2Uv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=richard.purdie@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XY3m02x45z2yNs
	for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2024 07:33:19 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so40723665e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729629192; x=1730233992; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HlQnp0Ek8CC7LCfhrHz4NaUjsHu6T9Ed7wLFFbYbEpk=;
        b=BbCew2UvV+270sgaBolbXATOzGm202JciW5BXe6mHLFGORBphBQuUMVsnJD2Lflpxk
         Jz9wEkP8rfh35Lp6QrgHDd9qk74Ih18QVmt929LB1DRTjlDZFaPBM94Jkt7pNWr0i1iJ
         x1AvEHAUJHvFl+kI+Q9uM8g5w/WPlzmntP4dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629192; x=1730233992;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlQnp0Ek8CC7LCfhrHz4NaUjsHu6T9Ed7wLFFbYbEpk=;
        b=Yl56HKwJS+KWA3oKSRtKNihRwTabGVrk+miC/kOW4529U2NybZNM8mHsx5id9KXz9I
         d2h/OzFyJO+NYUrWfVOnrWwyM6yzbTFCAOgBIhsQYyUYv3qn07raZKiZ2mu35xK9FcUk
         CIR+JbRjDZTV1oRwar0IwjQBEW9/i/cNa8fQ78rahqEbvCAq8BNX32zdcpFFjwhb5MKR
         hJm3HcdE2KFx92AoL8r8uu4teITZY0Gr7piYibjF7SbJWZhmCv6d/K7//wK2S+Qfshc2
         77sDBW4ap1AvE7+OkFoxDPgC+nFeRp+uj/RhG45aoq4iO5vF8mwyWqv1KMhXUmDqOGY9
         AMDg==
X-Gm-Message-State: AOJu0YyB8rT+YOU7pC8qUpJg7QzcGeSjWI2YoJWuxbmB/NkOH25/IoaF
	RHhHR8+znqoU4PQ7G5jHL/rzKIK5EVljS5Wojs/ppUCKabZ4Xz4d3Uh+CU797uNDgGApujje01+
	m
X-Google-Smtp-Source: AGHT+IFzHuIUs7W2j7rbfQtXh0/iP+78n4+HtNvgSHh9xpz1oz3SMM+rhesYnlAu1x+rwR5GnSRBeQ==
X-Received: by 2002:a05:600c:468a:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-431841440b5mr3331655e9.13.1729629192006;
        Tue, 22 Oct 2024 13:33:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f3ec:315d:2907:a25f? ([2001:8b0:aba:5f3c:f3ec:315d:2907:a25f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f570c86sm97745775e9.1.2024.10.22.13.33.11
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:33:11 -0700 (PDT)
Message-ID: <9939a99a8397f4473f21dd2931a6340ee552df68.camel@linuxfoundation.org>
Subject: OpenBMC and the Yocto Project
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openbmc@lists.ozlabs.org
Date: Tue, 22 Oct 2024 21:33:11 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Hi,

I know OpenBMC uses the Yocto Project and we occasionally see patches
from you. Some of the companies involved are Yocto Project members.

We're working on creating better information about who is using Yocto
Project and thought that the BMC use case might make an interesting
example. I looked through the openBMC docs but couldn't really work out
who the right people/group to talk to was about that. Is such a case
study something the project would be interested in and is there someone
we could work with on that? It should be good PR for both projects.

While I'm here I've also wondered how you're finding Yocto Project and
if there is anything we need to discuss. We tend to assume things must
be ok or you'd be talking to us but if that isn't the case, let us
know!

Cheers,

Richard
