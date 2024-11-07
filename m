Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 958539C11FE
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:51:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky3T39Pvz3cPp
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730939820;
	cv=none; b=V0KjlI7j6z0T4x/mKrIV5D7VAsnM4ON2LLiy0XO4/RtfQbqsO5iM4q7U4lupGOLMNO7JIbYyoSB5XXFqL1hqU7/gBmfP71RMV90svJsA85qjkuIPqwESH3i+ZSVb8NwIqicT5WFFoAG5U4lrNumDirZ8xoqu0Kv0T2QbLO3NtZ4NFz+pZ6OYuZdmv8AXWlJsK8caRv2pf3SaLXLyU8Yi0aG4HSxjRUKUBmZoXUeuHOrXG+gV8YWKxcN5XcYX3JHwkwEYuZ0RNq4jUZD5TCcAIwdlxjBHzRDux9Tow7zvtmOYsPpxN406la1qBjL9h8kMc60yLBu3YxHYQ8y/VqQcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730939820; c=relaxed/relaxed;
	bh=VZ2KJqDDlr0BpJVm1jVxEVWBDpJgOHV/yUofgteoeys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JV9B2SpRevdbpbtBsVl+9asD5F7KNzq+xP/GGdcZsMmg06FLDbBYfKBY9t5XlGzgWpB1RsSkJBVbz3s4VhOH2AIJd3il1wux8KrvYs1DPtswiPpwNBNzy5Pk7XL8lIdC++f0/TkEc3xOWyjSwn1GoPEyFKFTQXzURY8GR5ikFNF1t5mfwbffMYd29JbFsJ9n8WZwh4b0o5hiarI4r8jVig7ip/AT7qGK2dhRiSslPzrbLbqMQHIkGeGaD54oxRZG5RARm0sm9iZ26P5596i8h043F6FLpI4qYNxS7z30XtyoGFDtpKC+Em4q8CHqIqKEmyBBNVg5aN7pKQQ/UxyVyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLJLFp4R; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLJLFp4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkNS95Gnpz2yVM
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 11:36:57 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so406917a12.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2024 16:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730939814; x=1731544614; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ2KJqDDlr0BpJVm1jVxEVWBDpJgOHV/yUofgteoeys=;
        b=XLJLFp4RmBSGFWUFH00ieEsietnR+TCdSust/SeQmhpRnbDrYhOigMUXcLlnDbY60T
         YVXwc4E9BgpIakDULI+7+epYDP9YRTjXKe1Mq6Yzvv35qv3buKugoWv/xiuAiW/1RIxq
         frfBReQC4aHetfoW+kXc21sY6KlgLSgQfySLPD7UGtx5WcVgNnk0gc1+L5KjGhhfeZg5
         jqq3kgBB4PHek8ebePs29R4NzUFVyvfD2XKUKgZVh8GMD+3qLMx0Q9nmyPhNi1hQZ4CA
         tAmkU4yisT1VhR+dkHZdZX7gZ+7wruQzkXv256V95Mh2N98P4s0izBW3hoIOHa+bn+I9
         N+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730939814; x=1731544614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ2KJqDDlr0BpJVm1jVxEVWBDpJgOHV/yUofgteoeys=;
        b=kzMPuhxtmOe4/HyL0Se4iufDjbHGMiWmPdleEMCHaIcMhStZChHw/FUwMUhraCI01f
         Qs8I0Mye4WwMkurwQ0OKn0UyOwJ3LT7SO+9ID4DLkNYGYcYHgVcKeVKT8m9I9Ed1n2wv
         UugwCcny4CAP7ax6SXbcCRVK+EKOXB7K3XuumRtyNY/HR66LiluGox2wFGhitiPIwN+x
         T9SDEtqHSI6LoUJayJJsqH9syKpKapsJqCoqoY2nik6v8LaNYHA+y1d3DBOlI/tXyqjO
         4Oxx43sOMkw8D7r9wuCS4UY1CdhgvmUYpvEFVdk3Ox05ZmZSKLoLMU7eJs330O9kq7rQ
         3qmw==
X-Forwarded-Encrypted: i=1; AJvYcCW61IFFmJX1IauRsqb/BKJXDGnCa/3X7yS/we6uUy2z5elITzpdJ+2jQ5Jrb/OWN6h+TyLfARrW@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxw8K0X8nlGEziChduj0ojM7FQv6p9nETwHKkkZ15aBuLGLSu/7
	T/ooMbxcypZv/MH8C7yAp2xv8D4/pDhHne16MstOw9wQ61Wt3AWNwuAXsslHi0ts3rOdTLEeP4L
	FvkL/SIvLNPJ1+CW7ZDAfODPd6+M=
X-Google-Smtp-Source: AGHT+IETkScOSUxZd3ErqQbo+kcXH+PXR3sYrQW1guLOYuIVBc/zfUsa7sINCKMLWwhvbWzDzuqURQ9iowF7aNpXvoo=
X-Received: by 2002:a17:907:2d91:b0:a9a:80cc:c972 with SMTP id
 a640c23a62f3a-a9e655a8980mr2108644366b.27.1730939813501; Wed, 06 Nov 2024
 16:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-3-j2anfernee@gmail.com> <202411062051.TLRkJSSL-lkp@intel.com>
In-Reply-To: <202411062051.TLRkJSSL-lkp@intel.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Thu, 7 Nov 2024 08:36:16 +0800
Message-ID: <CA+4VgcKXQ4padSHBpnmw_vN5WWL+GfcJqOCtthN88C1hwicb6A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, llvm@lists.linux.dev, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, oe-kbuild-all@lists.linux.dev, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear kernel test robot,

Thank you for your response.
I would check these warnings.

kernel test robot <lkp@intel.com> =E6=96=BC 2024=E5=B9=B411=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Eason,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on jic23-iio/togreg]
> [also build test WARNING on linus/master v6.12-rc6 next-20241106]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eason-Yang/dt-bind=
ings-iio-adc-Add-binding-for-Nuvoton-NCT720x-ADCs/20241106-104046
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tog=
reg
> patch link:    https://lore.kernel.org/r/20241106023916.440767-3-j2anfern=
ee%40gmail.com
> patch subject: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/202411=
06/202411062051.TLRkJSSL-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5=
92c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241106/202411062051.TLRkJSSL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411062051.TLRkJSSL-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from drivers/iio/adc/nct720x.c:9:
>    In file included from include/linux/device.h:32:
>    In file included from include/linux/device/driver.h:21:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2213:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:518:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:524:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      525 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/iio/adc/nct720x.c:526:16: warning: cast to smaller integer typ=
e 'enum nct720x_chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>      526 |                 chip->type =3D (enum nct720x_chips)device_get_=
match_data(&client->dev);
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
>    5 warnings generated.
>
>
> vim +526 drivers/iio/adc/nct720x.c
>
>    511
>    512  static int nct720x_probe(struct i2c_client *client)
>    513  {
>    514          const struct i2c_device_id *id =3D i2c_client_get_device_=
id(client);
>    515          struct nct720x_chip_info *chip;
>    516          struct iio_dev *indio_dev;
>    517          int ret;
>    518          u32 tmp;
>    519
>    520          indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(=
*chip));
>    521          if (!indio_dev)
>    522                  return -ENOMEM;
>    523          chip =3D iio_priv(indio_dev);
>    524
>    525          if (client->dev.of_node)
>  > 526                  chip->type =3D (enum nct720x_chips)device_get_mat=
ch_data(&client->dev);
>    527          else
>    528                  chip->type =3D i2c_match_id(nct720x_id, client)->=
driver_data;
>    529
>    530          chip->vin_max =3D (chip->type =3D=3D nct7201) ? NCT7201_V=
IN_MAX : NCT7202_VIN_MAX;
>    531
>    532          ret =3D of_property_read_u32(client->dev.of_node, "read-v=
in-data-size", &tmp);
>    533          if (ret < 0) {
>    534                  pr_err("read-vin-data-size property not found\n")=
;
>    535                  return ret;
>    536          }
>    537
>    538          if (tmp =3D=3D 8) {
>    539                  chip->use_read_byte_vin =3D true;
>    540          } else if (tmp =3D=3D 16) {
>    541                  chip->use_read_byte_vin =3D false;
>    542          } else {
>    543                  pr_err("invalid read-vin-data-size (%d)\n", tmp);
>    544                  return -EINVAL;
>    545          }
>    546
>    547          mutex_init(&chip->access_lock);
>    548
>    549          /* this is only used for device removal purposes */
>    550          i2c_set_clientdata(client, indio_dev);
>    551
>    552          chip->client =3D client;
>    553
>    554          ret =3D nct720x_init_chip(chip);
>    555          if (ret < 0)
>    556                  return ret;
>    557
>    558          indio_dev->name =3D id->name;
>    559          indio_dev->channels =3D nct720x_channels;
>    560          indio_dev->num_channels =3D ARRAY_SIZE(nct720x_channels);
>    561          indio_dev->info =3D &nct720x_info;
>    562          indio_dev->modes =3D INDIO_DIRECT_MODE;
>    563
>    564          iio_device_register(indio_dev);
>    565
>    566          return 0;
>    567  }
>    568
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
