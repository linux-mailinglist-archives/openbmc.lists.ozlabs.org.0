Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC69546FE7
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 01:19:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcNw4dlsz3cFB
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 09:19:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.49; helo=mail-io1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKcNc4c55z2xss
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 09:19:11 +1000 (AEST)
Received: by mail-io1-f49.google.com with SMTP id p128so575837iof.1
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 16:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=w6/kh4HjOzEBvuz6Ur/jjW8tX9WaM1c5BN31mCejWHU=;
        b=iMn+KWE6b8jlrzf1q6kqAbMNjbdSRBo/m4doIYC71OmUzCb0ME4uxaJJ+7q+LtHKv/
         AkXhFEFEk6H4SBNifK0XQcUCfSLxPUcI1+OQKk4wneLEHs0EqtATgb/V8pq5AxlpGr95
         Y5F0GnF0adg55AkcyGxFCeVPFU5IlPsa93O1knVabIjzqHrLGiomHu+NaGNmpL0oDR09
         4+o9b9n4Hi4HZqVHJ+DkVmMOyBm/IUGjZfHe1mJkSgUjVyifuv+ts7fq0Ytm3nX/P4f/
         I1KwgrGZFKCiGTrUAK/R8NIWrO2a7hPbBq3lCtssuTKU9JbX3C9C6nfg6TCxwHL3K6GI
         0i4Q==
X-Gm-Message-State: AOAM5324xT00+r8QBmiCOWsFbNJqag3r43MSBLkJ4bCD97KOkHM5jEU1
	KcDkWzc+y/5DAbdhZrnaVg==
X-Google-Smtp-Source: ABdhPJz0JqUHi4hBKMy8DQnv8gczZeJSeHs4rGloBmyQoLoPWzcSY6+Rp9p8JpOoKIv2nOfCrcKwzw==
X-Received: by 2002:a05:6638:3383:b0:331:b268:261 with SMTP id h3-20020a056638338300b00331b2680261mr14809121jav.55.1654903148110;
        Fri, 10 Jun 2022 16:19:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e9-20020a921e09000000b002cde6e352dcsm152939ile.38.2022.06.10.16.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 16:19:07 -0700 (PDT)
Received: (nullmailer pid 2450356 invoked by uid 1000);
	Fri, 10 Jun 2022 23:19:06 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220610165940.2326777-6-jiaqing.zhao@linux.intel.com>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com> <20220610165940.2326777-6-jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: net: Add NCSI bindings
Date: Fri, 10 Jun 2022 17:19:06 -0600
Message-Id: <1654903146.313095.2450355.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 00:59:39 +0800, Jiaqing Zhao wrote:
> Add devicetree bindings for NCSI VLAN modes. This allows VLAN mode to
> be configured in devicetree.
> 
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
>  .../devicetree/bindings/net/ncsi.yaml         | 34 +++++++++++++++++++
>  MAINTAINERS                                   |  2 ++
>  include/dt-bindings/net/ncsi.h                | 15 ++++++++
>  3 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ncsi.yaml
>  create mode 100644 include/dt-bindings/net/ncsi.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ncsi.example.dtb: ethernet@1e660000: 'ncsi,vlan-mode' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^allegro,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '
 ^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asus,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^calamp,.*', '^calaosystems,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^c
 eva,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,
.*', '^chipone,.*', '^chipspark,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edimax,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^e
 mbest,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gardena,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix,.*', '^google,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon
 ,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*
', '^honestar,.*', '^honeywell,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hycon,.*', '^hydis,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^incircuit,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^injoinic,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inversepath,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*
 ', '^lattice,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongson,.*', '^lsi,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mikroe,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsubishi,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^
 mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novtech,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opencores,.*', '^openembed,.*', '^openrisc,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '
 ^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^s
 harp,.*', '^shimafuji,.*', '^shiratech,.*', '^si-en,.
*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^te
 chstar,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vot,.*', '^vxt,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wiligear,.*',
  '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win
link,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml
Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
Documentation/devicetree/bindings/net/ncsi.example.dtb:0:0: /example-0/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

