Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5961D7194
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 09:16:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QVgh1H7zzDq6N
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 17:16:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LWADo42F; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QVfy6DRRzDqP1
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 17:16:10 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id k19so3852425pll.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l8yxqpouhLyPhtOZLIufwX2JYTwIPyzQrrDBq8U513I=;
 b=LWADo42FJq8L8K9VgjqPbuh+X3OcHx0DzGqZGyiHQh7IkK29N3lfSnXfvueYs37mK/
 /Tca89tSwfUUUEHr7eQVrwDSFbxNQRAE3p2koJMMmlVi+2BDIQgzq6lWSQFdkdoGHng4
 7125HbV9bt0FOTpcve5wvNFVROYy2ZTvcpkm3JiRvuDxp9JRNOobRZ5EZhUYcb5+3/5h
 ZHroJvZfFZWDd4pPIV1xIb+hzvRNS1sfn4psjG3CVqEzD2ZgnCT323NdPW9V28QEMoxN
 8AcT/Sly9W6qPKxcHoK0GmZMBChwyZ5FBIo1RXRR75vIFwxL9OX89T09MD8DkJXW8Qe4
 wLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l8yxqpouhLyPhtOZLIufwX2JYTwIPyzQrrDBq8U513I=;
 b=GpawGmvUT2SI6PldHbZU0Ws1LhRY7emvRfE6g2NI+5JUCPkJePKn6DqkRQoiTr2DWC
 e7NT5z31BqHk+MOOUdSDYaIoja+Eh783ZQwzK2vdig23mPviEUB3clGOVCwxg8RkmR9w
 5Mz5GTfI4NyER/ruLHBaWcigFZiQwNN5RYVUfuHB067KMJcBQ89RNfGJBWY6SCU0LO5H
 GPFgTLpHMWKCZE5R5dYz66OkuucFc8YXvpPBN0nUxxRR9YGQ7an37zgbvoj7+0iW5qVh
 +GwoBR7soUg0aglYZTpNh+CELsfY0MlRxfiGT9G7+SrcorKOfkEQ1sAEHtT5ldrcPi7u
 SZug==
X-Gm-Message-State: AOAM531onNSpue8FkYc+bs2qhYA49geYPEyZ5LE6Fy2jinNG1S2c3ZJt
 RgbyhXQdeyTeNzVRF7d5XVzbAIBvlJ2ghQMb+GQ=
X-Google-Smtp-Source: ABdhPJyoZQhao1ye0o5jHTnYkfMvLh7PyHRavuLj5mCDbcP/KTqd2Zl7ujVMWGq0vqlwhDkqSP3tUvahb6D1CC727vQ=
X-Received: by 2002:a17:90b:608:: with SMTP id
 gb8mr19064232pjb.178.1589786166760; 
 Mon, 18 May 2020 00:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAB_SOc61Z0F=pkRfvjYUATAkQvYpu3+Qo7hSoGmmvT7+hzQhqA@mail.gmail.com>
 <20200515121343.GG1166713@heinlein>
In-Reply-To: <20200515121343.GG1166713@heinlein>
From: Zbyszek <zbigniewku@gmail.com>
Date: Mon, 18 May 2020 09:15:55 +0200
Message-ID: <CAB_SOc5x-ROPow8uWxi6Ln-OYiZXqRs=Qt_Qj2vMFU--JimzMw@mail.gmail.com>
Subject: Re: OpenBMC userguide questions
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
 anoo@us.ibm.com, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank you Patrick for your quick response.
I will apply your comments in the document.

pt., 15 maj 2020 o 14:13 Patrick Williams <patrick@stwcx.xyz> napisa=C5=82(=
a):
>
> Hi Zbyszek,
>
> In general, I would say you should follow the format of existing
> documents.  I think that answers the majoriy of your questions at a
> high-level.
>
> On Fri, May 15, 2020 at 08:49:49AM +0200, Zbyszek wrote:
> > * Should we use the reply markup to indicate side comments though-out?
>
> I would say no.  In Markdown ">" are for quotes.  You're not quoting
> anything.  Skimming through it seems like with a little effort you could
> just integrate these "side comments" into the document flow.
>
> > * Do we want to add user level doc to userguide? or put this doc under
> > security? Currently userguide only has a .tex including other markup.
>
> It looks like the userguide directory is for a .tex wrapper that was put
> in to generate a single document from a few Markdown sub-files.  The
> majority of the "content" of this file comes from the root directory, so
> it would seem that the pattern is to treat most things in root as
> "user-guides".
>
> The whole docs repository could use some reorganization, but we should
> treat that separate from this commit.
>
> > * Do we allow the `---` line separating doc header and text
> > introducing to document?
>
> No, let's follow the format of the existing documents.  Maybe a
> "## Introduction" would be just as appropriate in this case.
>
> --
> Patrick Williams
