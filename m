Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973971F1F2
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 20:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXFCv028Wz3dx6
	for <lists+openbmc@lfdr.de>; Fri,  2 Jun 2023 04:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HriZjkU9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HriZjkU9;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXFCJ3fmpz3c9R
	for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2023 04:34:03 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30af56f5f52so1146498f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2023 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685644438; x=1688236438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aJjyq/E6gNvCZGmi6YFoZ/SrNwQ392JEwJbAtyaDYk=;
        b=HriZjkU9VC72ihoBnQlHrZtNPP3pCWSrYXnwCmwbwB7zyV3Ja8LPWjdYPu50ob0ECh
         UeAAKZRLDA7EJP5niCpp2SF2Q+Wg2ctai3sTrQbEGbaA/xHw9neLR3i+3JPn5ZydadO6
         837P2EzKN8go0InV+1fKVRjYTq+/tcxXy4wGdD6BPH85OkdtmochitBb+Js4Eh+OHBFx
         gFQ+Cfri7LkQFl0XrURrvw8sIuwKRgjwq4vmJnHQe2etn41AAKVmfxb7wLHHpCp1Vuu2
         /hyF7AozrVu/nJYLo7TC1khiP4Ow4+SZmfME79dQ1Pz+E7snLwXqa6kNR4sbctjI3QBy
         v3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685644438; x=1688236438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aJjyq/E6gNvCZGmi6YFoZ/SrNwQ392JEwJbAtyaDYk=;
        b=LzT6qdodRFvrlgaQiLcxWeMHWcy9lCC3y1bvBGXHVb/7jdzTXI2qcmtq1gy86OmUlB
         chXL6WA5BOF7aGux5By95cXWD2iLMW/yXWqgcdt+qoQYQ2FTp6sMIxGoELwSd2K5Cuih
         8ttKLgDycD0HUs0u5WvqxBEaLUL4KiNdEaEJ64O2ItTS+PfPqObttLSeU9GS2SVPloSO
         KAxo1hqH7haFJi16tzdEvNzIlfoL0GOPfdE74TSBSXsGb7JNvJvq0T7FBN66bq8Z8Esy
         ejkU+x8zSwt7qxkeVHQipFFhEWIx1J0mANAXDWV2nyLJRodMUf8WavUc0BbmXgAwWloI
         6ciQ==
X-Gm-Message-State: AC+VfDxmV7BDMMma5XRSdWO0DYDe42UPau7Eg3V4KB0E8BYPKwlOgQ1L
	8x69I+2VL/NyIwd2SezDbawqBFpLRJvwqe0E2+Kd6A==
X-Google-Smtp-Source: ACHHUZ4AMqI/HFIEhvriOh42Eei0Y9OsThy7YzhwbcI2WgkR+XuFx20nzQz6QvUXA2pBYwxAtGcOlBS5YaXnnXbVNyo=
X-Received: by 2002:adf:e4c4:0:b0:309:3a1e:fc54 with SMTP id
 v4-20020adfe4c4000000b003093a1efc54mr2629197wrm.7.1685644437598; Thu, 01 Jun
 2023 11:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com> <CAH2-KxDfqpMLpeFkKn8BHkL2e7nwVBR+o3ziDBvw3KJd6fHwsg@mail.gmail.com>
In-Reply-To: <CAH2-KxDfqpMLpeFkKn8BHkL2e7nwVBR+o3ziDBvw3KJd6fHwsg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 1 Jun 2023 11:33:46 -0700
Message-ID: <CAH2-KxAEay+E=D9scS=2pHb7tOw0Vz5_ZoH_5=Q5o6sJdGE1Jg@mail.gmail.com>
Subject: Re: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb
To: Rohit Pai <ropai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 24, 2023 at 10:56=E2=80=AFAM Ed Tanous <edtanous@google.com> wr=
ote:
>
> On Wed, May 24, 2023 at 9:26=E2=80=AFAM Ed Tanous <edtanous@google.com> w=
rote:
> >
> > There's likely a few other minor things that would need fixed, but the
> > above is the general gist.
>
> I spent an hour or so and put together a simple POC of multithreading
> bmcweb.  It's not threadsafe for all the global structures (although I
> did one as an example), and has a lot of safety issues we'll need to
> work through, but will give us a hint about whether multi-threading
> bmcweb will solve your performance problem:
> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/63710
>
> PTAL

Rohit, Were you able to try this?
