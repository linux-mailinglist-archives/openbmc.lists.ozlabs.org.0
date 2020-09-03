Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C125BEEF
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 12:16:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhxYQ0CnDzDr5n
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 20:16:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhxXW4QjjzDr1Q
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 20:15:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=qR8iOL8x; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhxXV3pyPz9sTM;
 Thu,  3 Sep 2020 20:15:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1599128154; bh=7s3GLtb5esmGfKI0YLZnb42wJf5O+XrVQpNo0j4ayMA=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=qR8iOL8xZgBKRyyke1kDkWwlioWSPvmC2pCAq8c8taYjOE9HO3EFx6V1I0+nCV2xm
 eNx3JTLusS2eyfXnVYaKiOD9dUco+h6wVIw7PJyppu7eYoIQCHaqFa/z3nJsMV1mkE
 BSrP+nQaUoLwBUaJUE1mGdB9nriNCyk0cwe9awwyabJWhoxy69zFsfxQBLJHYlsrWi
 XpXt3J0GPVU7rAFSg3Gg+RQEWOh2DysaqUbawVq/G1VtQC+CQ0C08o0jQgGmbchTTc
 BSYUSJgwYKtp+tGiPRZs5Ct9qqJLFo8G8dryw+IwfL7ObzcMElUCpKGdzHp+gom5on
 S8cXIhqKX8Wpw==
Message-ID: <e2ff765d96571e247a812bbd8b039b5396eb5a98.camel@ozlabs.org>
Subject: Re: Resolving service name conflicts
From: Jeremy Kerr <jk@ozlabs.org>
To: Asmitha Karunanithi <asmithakarun@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 03 Sep 2020 18:15:50 +0800
In-Reply-To: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
References: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi Asmitha,

> To resolve this, the idea is to append the hostname of the client
> with the service name (whenever the service is being published),
> given that the hostname will always be unique in my case.
> 
> So, the service file would look like: (example.service)
> > > <service-group>
> > >        <name>example-hostname</name>
> > >        <service>
> > >                <type>...</type>
> > >                <port>...</port>
> > >        </service>
> > > </service-group>

The typical way to do this is just with the hostname only - the service
type distinguishes different services. So, yes: for better usability,
you'll want to include the hostname in the <name> tag, rather than a
fixed string.

The .service definitions support wildcards, which makes this super
easy. Something like this, from our current ssh config:

   <service-group>
     <name replace-wildcards="yes">%h</name>
     <service>
       <type>_ssh._tcp</type>
       <port>22</port>
     </service>
   </service-group>

Otherwise, as you've noticed, the tooling will just show multiple
(indistinguishable) entries for each BMC.

Given that the meta-phosphor configuration is to use the service name
(resulting in those duplicates), I've proposed a change to use the
hostname as the default instead:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36199

Cheers,


Jeremy

